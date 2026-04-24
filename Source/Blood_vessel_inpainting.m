% List of specific image numbers
imageNumbers = [33, 38, 41, 46, 51, 58, 76, 89, 90, 92];

% Base directories for the input images and masks
baseDirImages = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\Images\testing\';
baseDirMasks = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\testing\preprocessingOC';

% Output directory for the processed images
outputDir = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\testing\segmentasiOC';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

% Neighborhood sizes for inpainting
n = 30;  % Size of neighborhood for inpainting
N = 13;  % Size of neighborhood for median filter

for i = 1:length(imageNumbers)
    % Get the current image number
    imageNumber = imageNumbers(i);
    
    % Generate filenames for the image and mask
    imageFile = fullfile(baseDirImages, sprintf('drishtiGS_%03d.png', imageNumber));
    maskFile = fullfile(baseDirMasks, sprintf('cleaned_binary_%03d.png', imageNumber));
    
    % Check if the files exist
    if isfile(imageFile) && isfile(maskFile)
        % Read the original image and mask
        img = imread(imageFile);
        mask = imread(maskFile);
        
        % Convert the mask to a binary image
        binaryMask = imbinarize(mask(:,:,1));
        
        % Initialize the inpainted image
        inpaintedImg = img;
        
        % Inpainting process
        for channel = 1:3
            for row = 1:size(img, 1)
                for col = 1:size(img, 2)
                    if binaryMask(row, col)
                        % Define neighborhood boundaries
                        rowMin = max(1, row-n);
                        rowMax = min(size(img, 1), row+n);
                        colMin = max(1, col-n);
                        colMax = min(size(img, 2), col+n);
                        
                        % Extract neighborhood
                        neighborhood = img(rowMin:rowMax, colMin:colMax, channel);
                        neighborhoodMask = binaryMask(rowMin:rowMax, colMin:colMax);
                        
                        % Get non-vessel pixels in the neighborhood
                        nonVesselPixels = neighborhood(~neighborhoodMask);
                        
                        % Replace vessel pixel with the median of non-vessel pixels
                        if ~isempty(nonVesselPixels)
                            inpaintedImg(row, col, channel) = median(nonVesselPixels);
                        end
                    end
                end
            end
        end
        
        % Apply median filter to smooth the inpainted image
        for channel = 1:3
            inpaintedImg(:,:,channel) = medfilt2(inpaintedImg(:,:,channel), [N N]);
        end
        
        % Save the inpainted image to the output directory
        outputFileName = fullfile(outputDir, sprintf('inpainted_%03d.png', imageNumber));
        imwrite(inpaintedImg, outputFileName);
        
        % Debug: Print success message for saving inpainted image
        fprintf('Inpainted image saved for image number: %03d\n', imageNumber);
        
        % Debug: Show intermediate results
        figure;
        subplot(2,2,1), imshow(img), title('Original Image');
        subplot(2,2,2), imshow(binaryMask), title('Binary Mask');
        subplot(2,2,3), imshow(inpaintedImg), title('Inpainted Image');
    else
        fprintf('Files not found for image number: %03d\n', imageNumber);
    end
end

fprintf('Blood vessel inpainting process completed.\n');
