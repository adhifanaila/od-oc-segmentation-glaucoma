% List of specific image numbers
imageNumbers = [33, 38, 41, 46, 51, 58, 76, 89, 90, 92];

% Base directories for the input images and masks
baseDirImages = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\Images\testing';
baseDirMasks = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\mask';

% Output directory for the processed images
outputDir = 'C:\Users\Lenovo\OneDrive - Institut Teknologi Bandung\Documents\aTubespcb\testing\preprocessingOC';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

for i = 1:length(imageNumbers)
    % Get the current image number
    imageNumber = imageNumbers(i);
    
    % Generate filenames for the image and mask
    imageFile = fullfile(baseDirImages, sprintf('drishtiGS_%03d.png', imageNumber));
    maskFile = fullfile(baseDirMasks, sprintf('drishtiGS_%03d_mask.png', imageNumber));
    
    % Check if the files exist
    if isfile(imageFile) && isfile(maskFile)
        % Read the original image and mask
        img = imread(imageFile);
        mask = imread(maskFile);
        
        % Convert the mask to a binary image
        binaryMask = imbinarize(mask(:,:,1));
        
        % Apply the mask to the original image
        maskedImg = img;
        maskedImg(repmat(~binaryMask, [1 1 3])) = 0;
        
        % Remove blood vessels within the masked region
        grayImg = rgb2gray(maskedImg);
        
        % Enhance contrast using CLAHE (Contrast Limited Adaptive Histogram Equalization)
        enhancedImg = adapthisteq(grayImg, 'NumTiles', [8 8], 'ClipLimit', 0.02);
        
        % Additional image enhancement using median filtering
        filteredImg = medfilt2(enhancedImg, [3 3]);
        
        % Detect blood vessels using edge detection and morphological operations
        edges = edge(filteredImg, 'Canny', [0.1, 0.3]); % Adjust thresholds as necessary
        edges = imdilate(edges, strel('disk', 1));
        edges = imfill(edges, 'holes');
        edges = bwareaopen(edges, 20); % Remove small objects
        
        % Use adaptive thresholding as additional step
        bloodVessels = imbinarize(enhancedImg, 'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.7);
        bloodVessels = imopen(bloodVessels, strel('disk', 1));
        bloodVessels = bwareaopen(bloodVessels, 20); % Remove small objects
        
        % Combine the detected edges and blood vessel masks
        combinedMask = edges | bloodVessels;
        
        % Apply the combined mask to the original binary mask
        finalMask = binaryMask & combinedMask;
        
        % Invert the final binary mask to get black vessels on white background
        invertedBinaryMask = ~finalMask;
        
        % Save the inverted binary mask
        finalBinaryImg = uint8(invertedBinaryMask) * 255;
        outputFileName = fullfile(outputDir, sprintf('cleaned_binary_%03d.png', imageNumber));
        imwrite(finalBinaryImg, outputFileName);
        
        % Debug: Print success message for saving cleaned image
        fprintf('Cleaned inverted binary mask saved for image number: %03d\n', imageNumber);
        
        % Debug: Show intermediate results
        figure;
        subplot(2,3,1), imshow(img), title('Original Image');
        subplot(2,3,2), imshow(binaryMask), title('Binary Mask');
        subplot(2,3,3), imshow(maskedImg), title('Masked Image');
        subplot(2,3,4), imshow(enhancedImg), title('Enhanced Image');
        subplot(2,3,5), imshow(edges), title('Detected Edges');
        subplot(2,3,6), imshow(finalBinaryImg), title('Final Inverted Binary Image');
    else
        fprintf('Files not found for image number: %03d\n', imageNumber);
    end
end

fprintf('Blood vessel detection and inverted binary mask saving process completed.\n');