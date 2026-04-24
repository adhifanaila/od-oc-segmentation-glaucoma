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

- Binary_mask_Blood_Vessel
Fungsi : Membuat mask pembuluh darah untuk digunakan membuang pembuluh darah nantinya
Input : Citra Original OD dan OC + Mask Biner
Output : Gambar Biner Pembuluh darah

- Blood_vessel_inpainting
Fungsi : Meng-inpainting citra asli untuk didapatkan citra asli tanpa pembuluh darah
Input : Gambar Biner pembuluh darah yang didapatkan dari Binary_mask_Blood_Vessel 
Output : Gambar asli citra OC dan OD tanpa pembuluh darah