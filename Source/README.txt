- EksplorasiData_1.mlx
Fungsi : Menentukan Ukuran OC dan OD, Bounding Box, dan Lokasi Titik Tengah Bounding Box 
Input : Citra biner segmentasi dokter, yaitu OD (drishtiGS_xxx_ODAvgBoundary_OD_img) atau OC (drishtiGS_xxx_CupAvgBoundary_OC_img)
Output : Luas, ukuran bounding box, lokasi titik tengah bounding box dari OD dan OC

- EksplorasiData_2_CombinedHistogram.mlx
Fungsi : Mendapatkan rentang intensitas piksel seluruh gambar pada satu histogram untuk setiap kanal RGB
Input : Citra original dan citra biner segmentasi dokter
Output : Histogram setiap kanal RGB

- EksplorasiData_2_Histogram.mlx
Fungsi : Mendapatkan histogram dari piksel OD atau OC saja
Input : Citra original dan citra biner segmentasi dokter
Output : Histogram setiap kanal RGB untuk seluruh gambar

- EksplorasiData_3_FN.mlx
Fungsi : Mendapatkan gambar kandidat false negative untuk OD atau OC
Input : Citra original OD dan OC
Output : Gambar false negative pada setiap kanal RGB untuk seluruh gambar

- EksplorasiData_3_FP.mlx
Fungsi : Mendapatkan gambar kandidat false positive untuk OD atau OC
Input : Citra original OD dan OC
Output : Gambar false positive pada setiap kanal RGB untuk seluruh gambar

- SegmentasiOD_Lokalisasi.mlx
Fungsi : Mencari ROI dari gambar retina utuh
Input : Citra original
Output : Hasil lokalisasi berupa gambar cropped ROI dan gambar retina utuh dengan bounding box ROI, file %OD dan ROI Efficiency

- SegmentasiOD_Segmentasi.mlx
Fungsi : Melakukan segmentasi OD
Input : Citra hasil ROI
Output : Citra biner OD

- SegmentasiOD_Fscore.mlx
Fungsi : Menghitung FScore dari hasil segmentasi dan ellipse fitting OD
Input : Citra original
Output : File Fscore

- SegmentasiOC_Kmeans.mlx
Fungsi : Menghasilkan citra segmentasi OC dengan metode K-means
Input : Citra original
Output : Gambar segmentasi OC dan nilai Fscore

- SegmentasiOC_FCM.mlx
Fungsi : Menghasilkan citra segmentasi OC dengan metode FCM
Input : Citra original
Output : Gambar segmentasi OC dan nilai Fscore

- SegmentasiOC_SWFCM.m
Fungsi : Menghasilkan citra segmentasi OC dengan metode SWFCM
Input : Citra original
Output : Gambar segmentasi OC dan nilai Fscore

- Binary_mask_Blood_Vessel
Fungsi : Membuat mask pembuluh darah untuk digunakan membuang pembuluh darah nantinya
Input : Citra Original OD dan OC + Mask Biner
Output : Gambar Biner Pembuluh darah

- Blood_vessel_inpainting
Fungsi : Meng-inpainting citra asli untuk didapatkan citra asli tanpa pembuluh darah
Input : Gambar Biner pembuluh darah yang didapatkan dari Binary_mask_Blood_Vessel 
Output : Gambar asli citra OC dan OD tanpa pembuluh darah