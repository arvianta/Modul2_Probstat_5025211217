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
H0: μ1 = μ2 (Tidak terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali)
`

`
H1: μ1 != μ2 (Terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali)
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
> d. Nilai Kritikal(3)
```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```
#### _Output_
![3c](https://user-images.githubusercontent.com/88714570/207364889-55ca06f5-af1a-4d71-baf4-d4488f69934c.png)

> e. Keputusan(3)

`
Dari hasil t-test didapatkan p-value = 0.03024 berada dibawah 0.05. Maka H0 ditolak.
`

> f. Kesimpulan(3)

`
Dapat disimpulkan bahwa terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali.
`

## Soal 4 (Anova satu arah)
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Diketahui
```
Dataset -> https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama 
```
> a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

```R
library(ggplot2)

dataa <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h = T)
dataa$Group <- as.factor(dataa$Group)
dataa$Group = factor(dataa$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataa$Group)

Group1 <- subset(dataa, Group == "Kucing Oren")
Group2 <- subset(dataa, Group == "Kucing Hitam")
Group3 <- subset(dataa, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)
```

#### _Output_
![4a](https://user-images.githubusercontent.com/88714570/207373426-95dd13ff-098c-4b99-b4e8-e26b6537ea1a.png)
![4a2](https://user-images.githubusercontent.com/88714570/207373439-1e811cd5-c6a5-4fd0-8800-5f84bec0b02e.png)
![4a3](https://user-images.githubusercontent.com/88714570/207373448-934d1674-30b2-436b-a2f3-892188a8e9de.png)

> b. Carilah atau periksalah Homogeneity of variances nya, berapa nilai p yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?
```R
bartlett.test(Length ~ Group, data = dataa)
```
#### _Output_
```
	Bartlett test of homogeneity of variances

data:  Length by Group
Bartlett's K-squared = 0.43292, df = 2, p-value = 0.8054
```
> c. Untuk uji ANOVA, buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1.
```R
model1 = lm(Length ~ Group, data = dataa)
anova(model1)
```
#### _Output_
```
Analysis of Variance Table

Response: Length
           Df Sum Sq Mean Sq F value Pr(>F)   
Group       2 10.615  5.3074  7.0982 0.0013 **
Residuals 102 76.267  0.7477                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
> d. Dari Hasil Poin C, berapakah nilai-p ? Apa yang dapat Anda simpulkan dari H0?

`
Didapatkan p-value sebesar 0.0013. Dari hasil tersebut dapat disimpulkan bahwa perbedaan panjang kucing yang signifikan berdasarkan grupnya.
`

> e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
```R
TukeyHSD(aov(model1))
```
#### _Output_
```
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = model1)

$Group
                                diff        lwr        upr     p adj
Kucing Hitam-Kucing Oren  -0.7200000 -1.2116284 -0.2283716 0.0020955
Kucing Putih-Kucing Oren  -0.1028571 -0.5944855  0.3887713 0.8726158
Kucing Putih-Kucing Hitam  0.6171429  0.1255145  1.1087713 0.0098353
```

`
Dari hasil tersebut, dapat diketahui bahwa p-value setiap 2 jenis grup. Apabila p-value < 0.05, maka panjang kedua grup berbeda. Sedangkan apabila p-value > 0.05, maka panjang kedua grup sama. Ditinjau dari hasil di atas, dapat disimpulkan bahwa kucing putih dan kucing oren memiliki panjang yang sama.
`

> f. Visualisasikan data dengan ggplot2
```R
install.packages("ggplot2")
library("ggplot2")

ggplot(dataa, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
```
#### _Output_
![4f](https://user-images.githubusercontent.com/88714570/207377160-3363e063-3306-486d-807d-67088e1e9ece.png)

## SOAL 5 (Anova Dua Arah)
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view?usp=sharing
Dengan data tersebut:

> a. Buatlah plot sederhana untuk visualisasi data
```R
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("data_soal_5.csv")
```
```R
head(GTL)
```
#### _Output_
```R
# A tibble: 6 × 3
  Glass  Temp Light
  <chr> <dbl> <dbl>
1 A       100   580
2 A       100   568
3 A       100   570
4 B       100   550
5 B       100   530
6 B       100   579
```
```R
str(GTL)
```
#### _Output_
```R
spc_tbl_ [27 × 3] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ Glass: chr [1:27] "A" "A" "A" "B" ...
 $ Temp : num [1:27] 100 100 100 100 100 100 100 100 100 125 ...
 $ Light: num [1:27] 580 568 570 550 530 579 546 575 599 1090 ...
 - attr(*, "spec")=
  .. cols(
  ..   Glass = col_character(),
  ..   Temp = col_double(),
  ..   Light = col_double()
  .. )
 - attr(*, "problems")=<externalptr> 
 ```
 ```R
 qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
 ```
 #### _Output_
 ![5a](https://user-images.githubusercontent.com/88714570/207379571-b604700b-79c6-442f-832b-372dd36653f5.png)

> b. Lakukan uji ANOVA dua arah untuk 2 faktor
```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
#### _Output_
```
                  Df  Sum Sq Mean Sq F value   Pr(>F)    
Glass              2  150865   75432   206.4 3.89e-13 ***
Temp_Factor        2 1970335  985167  2695.3  < 2e-16 ***
Glass:Temp_Factor  4  290552   72638   198.7 1.25e-14 ***
Residuals         18    6579     366                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

> c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
#### _Output_
```R
# A tibble: 9 × 4
# Groups:   Glass [3]
  Glass  Temp  mean    sd
  <fct> <dbl> <dbl> <dbl>
1 A       150 1386   6   
2 B       150 1313  14.5 
3 A       125 1087.  2.52
4 C       125 1055. 10.6 
5 B       125 1035  35   
6 C       150  887. 18.6 
7 C       100  573. 26.5 
8 A       100  573.  6.43
9 B       100  553  24.6 
```

> d. Lakukan uji Tukey
```R
tukey <- TukeyHSD(anova)
print(tukey)
```
#### _Output_
```
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = Light ~ Glass * Temp_Factor, data = GTL)

$Glass
          diff        lwr       upr     p adj
B-A  -48.33333  -71.33487  -25.3318 0.0001206
C-A -177.11111 -200.11265 -154.1096 0.0000000
C-B -128.77778 -151.77932 -105.7762 0.0000000

$Temp_Factor
            diff      lwr      upr p adj
125-100 492.6667 469.6651 515.6682     0
150-100 628.8889 605.8874 651.8904     0
150-125 136.2222 113.2207 159.2238     0

$`Glass:Temp_Factor`
                    diff        lwr         upr     p adj
B:100-A:100  -19.6666667  -74.36273   35.029396 0.9307049
C:100-A:100    0.6666667  -54.02940   55.362729 1.0000000
A:125-A:100  514.6666667  459.97060  569.362729 0.0000000
B:125-A:100  462.3333333  407.63727  517.029396 0.0000000
C:125-A:100  482.0000000  427.30394  536.696063 0.0000000
A:150-A:100  813.3333333  758.63727  868.029396 0.0000000
B:150-A:100  740.3333333  685.63727  795.029396 0.0000000
C:150-A:100  314.0000000  259.30394  368.696063 0.0000000
C:100-B:100   20.3333333  -34.36273   75.029396 0.9179607
A:125-B:100  534.3333333  479.63727  589.029396 0.0000000
B:125-B:100  482.0000000  427.30394  536.696063 0.0000000
C:125-B:100  501.6666667  446.97060  556.362729 0.0000000
A:150-B:100  833.0000000  778.30394  887.696063 0.0000000
B:150-B:100  760.0000000  705.30394  814.696063 0.0000000
C:150-B:100  333.6666667  278.97060  388.362729 0.0000000
A:125-C:100  514.0000000  459.30394  568.696063 0.0000000
B:125-C:100  461.6666667  406.97060  516.362729 0.0000000
C:125-C:100  481.3333333  426.63727  536.029396 0.0000000
A:150-C:100  812.6666667  757.97060  867.362729 0.0000000
B:150-C:100  739.6666667  684.97060  794.362729 0.0000000
C:150-C:100  313.3333333  258.63727  368.029396 0.0000000
B:125-A:125  -52.3333333 -107.02940    2.362729 0.0670029
C:125-A:125  -32.6666667  -87.36273   22.029396 0.5065610
A:150-A:125  298.6666667  243.97060  353.362729 0.0000000
B:150-A:125  225.6666667  170.97060  280.362729 0.0000000
C:150-A:125 -200.6666667 -255.36273 -145.970604 0.0000000
C:125-B:125   19.6666667  -35.02940   74.362729 0.9307049
A:150-B:125  351.0000000  296.30394  405.696063 0.0000000
B:150-B:125  278.0000000  223.30394  332.696063 0.0000000
C:150-B:125 -148.3333333 -203.02940  -93.637271 0.0000006
A:150-C:125  331.3333333  276.63727  386.029396 0.0000000
B:150-C:125  258.3333333  203.63727  313.029396 0.0000000
C:150-C:125 -168.0000000 -222.69606 -113.303937 0.0000001
B:150-A:150  -73.0000000 -127.69606  -18.303937 0.0045830
C:150-A:150 -499.3333333 -554.02940 -444.637271 0.0000000
C:150-B:150 -426.3333333 -481.02940 -371.637271 0.0000000
```

> e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
```R
tukey.cld <- multcompLetters4(anova, tukey)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
#### _Output_
```R
# A tibble: 9 × 5
# Groups:   Glass [3]
  Glass  Temp  mean    sd Tukey
  <fct> <dbl> <dbl> <dbl> <chr>
1 A       150 1386   6    a    
2 B       150 1313  14.5  b    
3 A       125 1087.  2.52 c    
4 C       125 1055. 10.6  c    
5 B       125 1035  35    c    
6 C       150  887. 18.6  d    
7 C       100  573. 26.5  e    
8 A       100  573.  6.43 e    
9 B       100  553  24.6  e
```
