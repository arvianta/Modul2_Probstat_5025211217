# Praktikum 2 Probabilitas dan Statistik

**<br>Rayhan Arvianta Bayuputra**
**<br>5025211217
<br>Probstat A**

## SOAL 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 
|Responden|X|Y|
|:-------:| :------:| :------:|
| 1| 78| 100|  
| 2| 75| 95|  
| 3| 67| 70|  
| 4| 77| 90|  
| 5| 70| 90|  
| 6| 72| 90|  
| 7| 78| 89|  
| 8| 74| 90|  
| 9| 77| 100| 

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.
> a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel di atas
```R
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
difference <- before - after
sd(difference)
```
#### _Output_
```
[1] 6.359595
```
> b. Carilah nilai t (p-value)
```R
t.test(after, before, paired = TRUE)
```
#### _Output_
```
	Paired t-test

data:  after and before
t = 7.6525, df = 8, p-value = 6.003e-05
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
 11.33381 21.11064
sample estimates:
mean difference 
       16.22222 
```
> c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

`
Dari hasil dari poin B, diketahui bahwa nilai dari uji 𝑡 (p-value) adalah 0.00006003. Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05, maka hipotesis 0 ditolak. Dapat disimpulkan bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 pada tingkat signifikansi 5%
`

## SOAL 2 (Hipotesa 1 Sampel)
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 
> a. Apakah Anda setuju dengan klaim tersebut?
`
Setuju, karena dengan rata-rata 23.5000 dari sampel acak dengan standar deviasi 3900 kilometer maka sangat memungkin klaim tersebut valid. Melihat juga grafik dari persebaran data distribusi normal yang dihasilkan akan lebih pekat di daerah lebih dari 20.000 kilometer dengan asumsi nilai tengah grafik tersebut adalah rata-rata dari sampel acak yang didapatkan.
`

> b. Jelaskan maksud dari output yang dihasilkan!
```R
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```
#### _Output_
```
One-sample t-Test

data:  Summarized x
t = 60.256, df = 99, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 22726.16 24273.84
sample estimates:
mean of x 
    23500 
```
`
Output dari Z test adalah antara mean yang benar lebih dari 20000 atau hipotesis 1 dianggap sebagai yang benar.
`
> c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

`
Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05, maka hipotesis 0 ditolak dan hipotesis 1 diterima. Sehingga, dapat disimpulkan bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
`

## SOAL 3 (Hipotesa 2 sampel)
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
| Nama Kota/Atribut | **Bandung** | **Bali** |
|:-----------:| :------:| :------:|
| **Jumlah Saham**| 19| 27|  
| **Sampel Mean**| 3.64| 2.79|  
| **Sampel Standar Deviasi**| 1.67| 1.32|  

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α = 0.05)? Buatlah:
> a. H0 dan H1(3)

`
H0: miu1 = miu2 (Tidak terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali)
`

`
H1: miu1 != miu2 (Terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali)
`

> b. Hitung Sampel Statistik(3)
```R
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```
#### _Output_
```
Standard Two-Sample t-Test

data:  Summarized x and y
t = 1.9267, df = 44, p-value = 0.03024
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
 0.1087406        NA
sample estimates:
mean of x mean of y 
     3.64      2.79 
```
> c. Lakukan Uji Statistik (df = 2)(5)
```R
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "pink")
```
