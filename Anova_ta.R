> Anova(putinanov, type=3)
Anova Table (Type III tests)

Response: Mass_kg
Sum Sq  Df F value    Pr(>F)    
(Intercept) 388586   1  5182.4 < 2.2e-16 ***
  Population  292693   3  1301.2 < 2.2e-16 ***
  Residuals    28118 375                      
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> summary(putinanov)

Call:
  lm(formula = Mass_kg ~ Population, data = data.Q1)

Residuals:
  Min       1Q   Median       3Q      Max 
-24.1667  -6.3041  -0.2702   5.6565  24.3833 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  66.0767     0.9179  71.989  < 2e-16 ***
  PopulationB   8.1712     1.4006   5.834 1.17e-08 ***
  PopulationC  33.5035     1.2010  27.897  < 2e-16 ***
  PopulationD  72.8335     1.2679  57.444  < 2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.659 on 375 degrees of freedom
Multiple R-squared:  0.9124,	Adjusted R-squared:  0.9117 
F-statistic:  1301 on 3 and 375 DF,  p-value: < 2.2e-16

> pairs(Mass_kg ~ Population, data=data.Q1)
> plot(putinanov)
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > library(heplots)
> etasq(putinanov)
Partial eta^2
Population     0.9123532
Residuals             NA
> library(ggplot2)
> require(ggplot2)
putinplot <- ggplot(data=data.Q1, aes(x=Population, y=data.Q1$Mass_kg)) + geom_boxplot(aes(fill=Population))
print(putinplot + labs(title = "                                                                                        Mass_Kg vs Supplement Formulation", x = "Supplment Formulation", y = "Mass_kg", fill ="Formulation"))
> ggplot(data.Q1, aes(x=Population, y=Mass_kg)) + 
  +     geom_jitter(position=position_jitter(0.2), shape=17)
> stripplot <- ggplot(data.Q1, aes(x=Population, y=Mass_kg)) + 
  geom_jitter(position=position_jitter(0.2), shape=18, cex=3)
> stripplot <- ggplot(data.Q1, aes(x=Population, y=Mass_kg, shape=Population)) + 
  +     geom_jitter(position=position_jitter(0.2), cex=3)
> stripplot + scale_shape_manual(values=c(1,17,19,20))
> stripplot + stat_summary(fun.y=mean, geom="point", shape=18,
                         size=3, color="red")
> stripplot + stat_summary(fun.y=mean, geom="point", shape=c(16,17,18,19),
                           +                  size=3, color="blue")
> stripplot <- ggplot(data.Q1, aes(x=Population, y=Mass_kg, shape=Population)) + 
  geom_jitter(position=position_jitter(0.2), shape=18, cex=3)
> stripplot <- ggplot(data.Q1, aes(x=Population, y=Mass_kg, shape=Population)) + 
  geom_jitter(position=position_jitter(0.2), cex=3)
> print(stripplot + labs(title = "                                                                                        Mass_Kg vs Supplement Formulation", x = "Supplment Formulation", y = "Mass_kg", shape ="Formulation"))
> print(stripplot + labs(title = "                                                                                        Mass_Kg vs Supplement Formulation", x = "Supplment Formulation", y = "Mass_kg", shape ="Formulation") + stat_summary(fun.y=mean, geom="point", size=3, color="blue"))

> library(MASS)
> dat2 <-data.frame(mvrnorm(125, c(16.99, 22.56),
                            +                           matrix(runif(1, 0.98, 0.99),
                                                               +                                  nrow = 2, ncol=2) +
                              +                               diag(2)*runif(1, 0.6, 0.65)))
> data.Q2 <-dat2
> colnames(data.Q2) <-c("Beak_Depth_mm", "Fitness")
> head(data.Q2)
Beak_Depth_mm  Fitness
1      18.80280 23.27366
2      16.01974 21.45664
3      16.74657 22.41958
4      18.10760 22.96958
5      15.54529 20.56310
6      16.09076 22.41846
> plot(data.Q2)
> darwinlm <- lm(Fitness ~ Beak_Depth_mm, data = data.Q2)
> 
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > summary(darwinlm)

Call:
  lm(formula = Fitness ~ Beak_Depth_mm, data = data.Q2)

Residuals:
  Min      1Q  Median      3Q     Max 
-1.8010 -0.6250 -0.0525  0.5369  2.4340 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)   11.94126    1.03540   11.53   <2e-16 ***
  Beak_Depth_mm  0.62257    0.06092   10.22   <2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8368 on 123 degrees of freedom
Multiple R-squared:  0.4592,	Adjusted R-squared:  0.4548 
F-statistic: 104.4 on 1 and 123 DF,  p-value: < 2.2e-16

> plot(data.Q2)
> abline(darwinlm)
> ggplot(data.Q2, aes(x=Beak_Depth_mm, y=Fitness)) + geom_point(size=2, shape=25) + geom_smooth(method=lm) + labs(title = "                                                                                Fitness vs Beak_Depth_mm")
> ggplot(data.Q2, aes(x=Beak_Depth_mm, y=Fitness, color=Fitness)) + geom_point(size=2, shape=25) + geom_smooth(method=lm) + labs(title = "                                                                           Fitness vs Beak_Depth_mm")
> darwinlm <- lm(Fitness ~ Beak_Depth_mm, data = data.Q2)
> plot(darwinlm)
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > 
  > install.packages("AER")
Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/src/contrib/AER_1.2-5.tar.gz'
Content type 'application/x-gzip' length 2179901 bytes (2.1 MB)
==================================================
  downloaded 2.1 MB

* installing *source* package ‘AER’ ...
** package ‘AER’ successfully unpacked and MD5 sums checked
** R
** data
** demo
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
* DONE (AER)

The downloaded source packages are in
‘/tmp/RtmpbYr2HN/downloaded_packages’
> library(AER)
Loading required package: car
Loading required package: carData
Loading required package: lmtest
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:
  
  as.Date, as.Date.numeric

Loading required package: sandwich
Loading required package: survival
> coeftest(darwinlm, vcov=vcovHC (darwinlm, type="HC1"))

t test of coefficients:
  
  Estimate Std. Error t value  Pr(>|t|)    
(Intercept)   11.052153   0.947816  11.661 < 2.2e-16 ***
  Beak_Depth_mm  0.676459   0.057332  11.799 < 2.2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> summary(darwinlm)

Call:
  lm(formula = Fitness ~ Beak_Depth_mm, data = data.Q2)

Residuals:
  Min       1Q   Median       3Q      Max 
-2.87792 -0.48589  0.04916  0.58095  1.81731 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)   11.05215    1.01739   10.86   <2e-16 ***
  Beak_Depth_mm  0.67646    0.06036   11.21   <2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8647 on 123 degrees of freedom
Multiple R-squared:  0.5053,	Adjusted R-squared:  0.5012 
F-statistic: 125.6 on 1 and 123 DF,  p-value: < 2.2e-16
> ggplot(data.Q2, aes(x=Beak_Depth_mm, y=Fitness, color=Fitness)) + geom_point(size=2, shape=25) + geom_smooth(method=lm) + labs(title = "                                                                           Fitness vs Beak_Depth_mm") + stat_ellipse()
> library(lattice)
> bwplot(Y ~ X, data = data.Q3)
> plot(Y ~ X, data = data.Q3)
> qqnorm(data.Q3$X, main = "QQplot$X")
> qqline(data.Q3$X)
> qqnorm(data.Q3$Y, main = "QQplot$Y")
> qqline(data.Q3$Y)
> q3lm <- lm(Y ~ X, data = data.Q3)
> pairs(Y ~ X, data = data.Q3)
> bwplot(Y ~ X, main = "Conditional Boxplot", data = data.Q3)
> plot(Y ~ X, main = "Scatterplot", data = data.Q3)
> 
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > data.Q3treatment <- data.Q3
> data.Q3treated <- rm.outlier(data.Q3, fill = FALSE, median = FALSE, opposite = FALSE)
> plot(data.Q3treated)
> q3lmtreated <- lm(Y ~ X, data = data.Q3treated)
> plot(q3lmtreated)
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > cooksd <- cooks.distance(q3lm)
> cooksd
1            2            3            4            5            6            7            8            9           10 
5.798631e-06 1.124530e-03 1.157930e-02 4.506399e-04 3.030041e-05 3.040060e-03 2.048684e-02 7.295645e-04 2.328437e-05 8.325360e-04 
11           12           13           14           15           16           17           18           19           20 
7.410197e-04 1.170281e-05 2.080267e-03 8.562070e-04 1.206506e-03 2.868543e-02 1.570486e-04 1.883060e-03 1.033273e-03 1.057107e-02 
21           22           23           24           25           26           27           28           29           30 
9.845638e-04 5.740645e-03 2.019789e-03 1.314420e-02 1.283215e-03 9.148775e-04 1.170808e-03 6.626986e-05 8.917511e-04 8.328708e-04 
31           32           33           34           35           36           37           38           39           40 
7.887898e-04 3.282094e-03 5.718804e-03 1.480528e-02 1.973871e-03 9.434428e-01 8.695799e-04 1.737793e-03 2.110403e-05 1.817949e-03 
41           42           43           44           45           46           47           48           49           50 
1.787431e-04 4.383538e-03 7.133324e-04 4.449737e-03 3.808831e-03 5.302087e-03 3.496102e-04 2.589233e-02 1.121540e-03 7.455662e-04 
51           52           53           54           55           56           57           58           59           60 
4.339732e-04 4.077013e-02 5.354612e-03 1.916771e-02 8.548464e-03 1.763881e-04 5.673380e-06 2.140332e-03 8.509774e-05 2.570066e-03 
61           62           63           64           65           66           67           68           69           70 
3.752827e-05 1.022046e-03 4.532313e-04 2.772094e-04 1.200050e-04 2.861311e-06 1.683186e-03 3.723117e-03 2.541165e-04 6.519076e-03 
71           72           73           74           75           76           77           78           79           80 
2.675161e-05 9.064891e-04 4.896662e-04 1.787689e-04 1.077986e-05 2.647356e-03 1.595705e-03 1.767049e-03 1.140182e-02 4.821600e-04 
81           82           83           84           85           86           87           88           89           90 
7.586599e-05 1.509283e-03 4.558829e-03 8.782650e-03 3.584322e-03 2.109620e-04 3.407585e-04 2.497125e-04 5.336356e-03 2.858314e-03 
91           92           93           94           95           96           97           98           99          100 
4.202259e-05 2.311386e-05 4.294374e-06 3.153109e-03 5.920159e-04 1.293149e-03 8.762853e-04 4.074919e-04 1.882209e-04 1.043480e-04 
101          102          103          104          105          106          107          108          109          110 
1.403931e-02 1.648107e-03 2.046260e-03 1.084760e-02 6.904763e-03 1.515777e-05 7.802004e-03 5.822710e-06 4.966073e-04 5.227956e-03 
111          112          113          114          115          116          117          118          119          120 
9.118240e-05 6.385560e-04 7.219754e-04 5.566328e-03 4.025433e-03 3.424800e-04 8.817320e-04 3.353424e-04 2.932015e-04 2.799853e-02 
121          122          123          124          125          126          127          128          129          130 
1.056710e-03 3.993795e-03 1.606827e-03 7.281123e-04 9.322735e-04 6.652284e-03 3.701477e-03 1.341567e-03 1.695953e-04 2.468532e-03 
131          132          133          134          135          136          137          138          139          140 
1.855227e-04 1.338144e-03 1.792240e-04 8.424631e-03 1.721209e-04 4.054639e-04 8.043280e-04 4.934819e-04 1.954140e-03 6.746263e-04 
141          142          143          144          145          146          147          148          149          150 
1.516909e-04 9.433789e-04 1.806830e-07 9.576999e-04 2.905662e-04 2.018687e-04 1.295608e-04 2.338239e-03 1.165994e-03 1.016904e-03 
> plot(cooksd)
> abline(h = 4*mean(coabline(h = 4*mean(cooksd, na.rm=T)
                             + 
                               
                               > abline(h = 4*mean(cooksd, na.rm=T), col="red")
                             > abline(h = 2*mean(cooksd, na.rm=T), col="red")
                             > influential <- as.numeric(names(cooksd)[(cooksd > 4*mean(cooksd, na.rm=T))])
                             > head(data.Q3[influential, ])
                             Y         X
                             36 0.025000 0.6000000
                             52 0.269689 0.4074132
                             > library(car)
                             Loading required package: carData
                             > library(outliers)
                             > car::outlierTest(q3lm)
                             rstudent unadjusted p-value Bonferonni p
                             36 -12.63076         3.1487e-25   4.7231e-23
                             > rm.outlier(data.Q3, fill = FALSE, median = FALSE, opposite = FALSE)
                             
                             > data.Q3treatment <- data.Q3[-36,]
                             > plot(data.Q3treatment)
                             > plot(Y ~ X, data=data.Q3treatment)
                             > q3lmtreatment <- lm(Y ~ X, data = data.Q3treatment)
                             > plot(q3lmtreatment)
                             Hit <Return> to see next plot: 
                               Hit <Return> to see next plot: 
                               Hit <Return> to see next plot: 
                               Hit <Return> to see next plot: 
                               > summary(q3lmtreatment)
                             
                             Call:
                               lm(formula = Y ~ X, data = data.Q3treatment)
                             
                             Residuals:
                               Min        1Q    Median        3Q       Max 
                             -0.032017 -0.010528 -0.001604  0.008494  0.053526 
                             
                             Coefficients:
                               Estimate Std. Error t value Pr(>|t|)    
                             (Intercept)  0.278305   0.003676    75.7   <2e-16 ***
                               X           -0.092026   0.002307   -39.9   <2e-16 ***
                               ---
                               Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                             
                             Residual standard error: 0.01549 on 147 degrees of freedom
                             Multiple R-squared:  0.9154,	Adjusted R-squared:  0.9149 
                             F-statistic:  1592 on 1 and 147 DF,  p-value: < 2.2e-16
> outlier(data.Q3, opposite = FALSE, logical = F)
                             Y X 
                             0 0 
> outlier(data.Q3, opposite = TRUE, logical = T)
                             > plot(cooksd)
                             > abline(h = 4*mean(coabline(h = 4*mean(cooksd, na.rm=T)
                                                          + 
                                                            
                                                            > abline(h = 4*mean(cooksd, na.rm=T), col="red")
                                                          > abline(h = 2*mean(cooksd, na.rm=T), col="red")
                                                          > influential <- as.numeric(names(cooksd)[(cooksd > 4*mean(cooksd, na.rm=T))])
                                                          > head(data.Q3[influential, ])
                                                          Y         X
                                                          36 0.025000 0.6000000
                                                          52 0.269689 0.4074132
                                                          > library(car)
                                                          Loading required package: carData
                                                          > library(outliers)
                                                          > car::outlierTest(q3lm)
                                                          rstudent unadjusted p-value Bonferonni p
                                                          
                                                          
                                                          
                                                          R version 3.4.2 (2017-09-28) -- "Short Summer"
                                                          Copyright (C) 2017 The R Foundation for Statistical Computing
                                                          Platform: x86_64-pc-linux-gnu (64-bit)
                                                          
                                                          R is free software and comes with ABSOLUTELY NO WARRANTY.
                                                          You are welcome to redistribute it under certain conditions.
                                                          Type 'license()' or 'licence()' for distribution details.
                                                          
                                                          Natural language support but running in an English locale
                                                          
                                                          R is a collaborative project with many contributors.
                                                          Type 'contributors()' for more information and
                                                          'citation()' on how to cite R or R packages in publications.
                                                          
                                                          Type 'demo()' for some demos, 'help()' for on-line help, or
                                                          'help.start()' for an HTML browser interface to help.
                                                          Type 'q()' to quit R.
                                                          
                                                          [Workspace loaded from ~/R/.RData]
                                                          
                                                          > setwd("~/Documents/BIOMETRY/week9")
                                                          > load("~/Documents/BIOMETRY/week9/data.Q3.csv")
                                                          Error in load("~/Documents/BIOMETRY/week9/data.Q3.csv") : 
                                                            bad restore file magic number (file may be corrupted) -- no data loaded
                                                          In addition: Warning message:
                                                            file ‘data.Q3.csv’ has magic number 'Y,X0'
                                                          Use of save versions prior to 2 is deprecated 
                                                          > library(MASS)
                                                          > load("~/Documents/BIOMETRY/week9/data.Q3.csv")
                                                          Error in load("~/Documents/BIOMETRY/week9/data.Q3.csv") : 
                                                            bad restore file magic number (file may be corrupted) -- no data loaded
                                                          In addition: Warning message:
                                                            file ‘data.Q3.csv’ has magic number 'Y,X0'
                                                          Use of save versions prior to 2 is deprecated 
                                                          > library(XLConnect)
                                                          Error in library(XLConnect) : there is no package called ‘XLConnect’
                                                          > install.packages("xlconnect")
                                                          Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
                                                          (as ‘lib’ is unspecified)
                                                          Warning in install.packages :
                                                            package ‘xlconnect’ is not available (for R version 3.4.2)
                                                          Warning in install.packages :
                                                            Perhaps you meant ‘XLConnect’ ?
                                                            > install.packages("XLConnect")
                                                          Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
                                                          (as ‘lib’ is unspecified)
                                                          also installing the dependencies ‘XLConnectJars’, ‘rJava’
                                                          
                                                          trying URL 'https://cran.rstudio.com/src/contrib/XLConnectJars_0.2-15.tar.gz'
                                                          Content type 'application/x-gzip' length 14787131 bytes (14.1 MB)
                                                          ==================================================
                                                            downloaded 14.1 MB
                                                          
                                                          trying URL 'https://cran.rstudio.com/src/contrib/rJava_0.9-9.tar.gz'
                                                          Content type 'application/x-gzip' length 660454 bytes (644 KB)
                                                          ==================================================
                                                            downloaded 644 KB
                                                          
                                                          trying URL 'https://cran.rstudio.com/src/contrib/XLConnect_0.2-15.tar.gz'
                                                          Content type 'application/x-gzip' length 9694760 bytes (9.2 MB)
                                                          ==================================================
                                                            downloaded 9.2 MB
                                                          
                                                          * installing *source* package ‘rJava’ ...
                                                          ** package ‘rJava’ successfully unpacked and MD5 sums checked
                                                          checking for gcc... gcc -std=gnu99
                                                          checking whether the C compiler works... yes
                                                          checking for C compiler default output file name... a.out
                                                          checking for suffix of executables... 
                                                          checking whether we are cross compiling... no
                                                          checking for suffix of object files... o
                                                          checking whether we are using the GNU C compiler... yes
                                                          checking whether gcc -std=gnu99 accepts -g... yes
                                                          checking for gcc -std=gnu99 option to accept ISO C89... none needed
                                                          checking how to run the C preprocessor... gcc -std=gnu99 -E
                                                          checking for grep that handles long lines and -e... /bin/grep
                                                          checking for egrep... /bin/grep -E
                                                          checking for ANSI C header files... yes
                                                          checking for sys/wait.h that is POSIX.1 compatible... yes
                                                          checking for sys/types.h... yes
                                                          checking for sys/stat.h... yes
                                                          checking for stdlib.h... yes
                                                          checking for string.h... yes
                                                          checking for memory.h... yes
                                                          checking for strings.h... yes
                                                          checking for inttypes.h... yes
                                                          checking for stdint.h... yes
                                                          checking for unistd.h... yes
                                                          checking for string.h... (cached) yes
                                                          checking sys/time.h usability... yes
                                                          checking sys/time.h presence... yes
                                                          checking for sys/time.h... yes
                                                          checking for unistd.h... (cached) yes
                                                          checking for an ANSI C-conforming const... yes
                                                          checking whether time.h and sys/time.h may both be included... yes
                                                          configure: checking whether gcc -std=gnu99 supports static inline...
                                                          yes
                                                          checking whether setjmp.h is POSIX.1 compatible... yes
                                                          checking whether sigsetjmp is declared... yes
                                                          checking whether siglongjmp is declared... yes
                                                          checking Java support in R... present:
                                                            interpreter : '/usr/lib/jvm/default-java/jre/bin/java'
                                                          archiver    : '/usr/lib/jvm/default-java/bin/jar'
                                                          compiler    : '/usr/lib/jvm/default-java/bin/javac'
                                                          header prep.: '/usr/lib/jvm/default-java/bin/javah'
                                                          cpp flags   : '-I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux'
                                                          java libs   : '-L/usr/lib/jvm/default-java/jre/lib/amd64/server -ljvm'
                                                          checking whether Java run-time works... yes
                                                          checking whether -Xrs is supported... yes
                                                          checking whether JNI programs can be compiled... yes
                                                          checking JNI data types... ok
                                                          checking whether JRI should be compiled (autodetect)... yes
                                                          checking whether debugging output should be enabled... no
                                                          checking whether memory profiling is desired... no
                                                          checking whether threads support is requested... no
                                                          checking whether callbacks support is requested... no
                                                          checking whether JNI cache support is requested... no
                                                          checking whether headless init is enabled... no
                                                          checking whether JRI is requested... yes
                                                          configure: creating ./config.status
                                                          config.status: creating src/Makevars
                                                          config.status: creating R/zzz.R
                                                          config.status: creating src/config.h
                                                          === configuring in jri (/tmp/RtmpPFMVuJ/R.INSTALL2cde4fdc77c/rJava/jri)
                                                          configure: running /bin/bash ./configure --disable-option-checking '--prefix=/usr/local'  --cache-file=/dev/null --srcdir=.
                                                          checking build system type... x86_64-unknown-linux-gnu
                                                          checking host system type... x86_64-unknown-linux-gnu
                                                          checking for gcc... gcc -std=gnu99
                                                          checking whether the C compiler works... yes
                                                          checking for C compiler default output file name... a.out
                                                          checking for suffix of executables... 
                                                          checking whether we are cross compiling... no
                                                          checking for suffix of object files... o
                                                          checking whether we are using the GNU C compiler... yes
                                                          checking whether gcc -std=gnu99 accepts -g... yes
                                                          checking for gcc -std=gnu99 option to accept ISO C89... none needed
                                                          checking how to run the C preprocessor... gcc -std=gnu99 -E
                                                          checking for grep that handles long lines and -e... /bin/grep
                                                          checking for egrep... /bin/grep -E
                                                          checking for ANSI C header files... yes
                                                          checking whether Java interpreter works... checking whether JNI programs can be compiled... yes
                                                          checking whether JNI programs can be run... yes
                                                          checking JNI data types... ok
                                                          checking whether Rinterface.h exports R_CStackXXX variables... yes
                                                          checking whether Rinterface.h exports R_SignalHandlers... yes
                                                          configure: creating ./config.status
                                                          config.status: creating src/Makefile
                                                          config.status: creating Makefile
                                                          config.status: creating run
                                                          config.status: creating src/config.h
                                                          ** libs
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c Rglue.c -o Rglue.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c arrayc.c -o arrayc.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c callJNI.c -o callJNI.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c callback.c -o callback.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c fields.c -o fields.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c init.c -o init.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c jri_glue.c -o jri_glue.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c loader.c -o loader.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c otables.c -o otables.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c rJava.c -o rJava.o
                                                          gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I. -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux     -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c tools.c -o tools.o
                                                          gcc -std=gnu99 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o rJava.so Rglue.o arrayc.o callJNI.o callback.o fields.o init.o jri_glue.o loader.o otables.o rJava.o tools.o -L/usr/lib/jvm/default-java/jre/lib/amd64/server -ljvm -L/usr/lib/R/lib -lR
                                                          (cd ../jri && make)
                                                          make[1]: Entering directory '/tmp/RtmpPFMVuJ/R.INSTALL2cde4fdc77c/rJava/jri'
                                                          make -C src JRI.jar
                                                          make[2]: Entering directory '/tmp/RtmpPFMVuJ/R.INSTALL2cde4fdc77c/rJava/jri/src'
                                                          /usr/lib/jvm/default-java/bin/javac -target 1.6 -source 1.6 -d . ../package-info.java ../REXP.java ../RFactor.java ../Mutex.java ../RConsoleOutputStream.java ../RMainLoopCallbacks.java ../RVector.java ../RBool.java ../RList.java ../Rengine.java
                                                          warning: [options] bootstrap class path not set in conjunction with -source 1.6
                                                          Note: Some input files use unchecked or unsafe operations.
                                                          Note: Recompile with -Xlint:unchecked for details.
                                                          1 warning
                                                          /usr/lib/jvm/default-java/bin/javah -d . -classpath . org.rosuda.JRI.Rengine
                                                          gcc -std=gnu99 -c -o Rengine.o Rengine.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux -I/usr/share/R/include -I/usr/share/R/include
                                                          gcc -std=gnu99 -c -o jri.o jri.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux -I/usr/share/R/include -I/usr/share/R/include
                                                          gcc -std=gnu99 -c -o Rcallbacks.o Rcallbacks.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux -I/usr/share/R/include -I/usr/share/R/include
                                                          gcc -std=gnu99 -c -o Rinit.o Rinit.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/share/R/include -I/usr/share/R/include
                                                          gcc -std=gnu99 -c -o globals.o globals.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux
                                                          gcc -std=gnu99 -c -o rjava.o rjava.c -g -Iinclude  -DRIF_HAS_CSTACK -DRIF_HAS_RSIGHAND -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux  -fpic -I/usr/lib/jvm/default-java/include -I/usr/lib/jvm/default-java/include/linux
                                                          rjava.c: In function ‘RJava_request_lock’:
                                                            rjava.c:22:3: warning: ignoring return value of ‘write’, declared with attribute warn_unused_result [-Wunused-result]
                                                          write(ipcout, buf, sizeof(ptrlong));
                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                            rjava.c: In function ‘RJava_clear_lock’:
                                                            rjava.c:30:3: warning: ignoring return value of ‘write’, declared with attribute warn_unused_result [-Wunused-result]
                                                          write(ipcout, buf, sizeof(ptrlong));
                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                            rjava.c: In function ‘RJava_request_callback’:
                                                            rjava.c:39:3: warning: ignoring return value of ‘write’, declared with attribute warn_unused_result [-Wunused-result]
                                                          write(ipcout, buf, sizeof(ptrlong) * 3);
                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                            rjava.c: In function ‘RJava_init_ctrl’:
                                                            rjava.c:51:3: warning: ignoring return value of ‘write’, declared with attribute warn_unused_result [-Wunused-result]
                                                          write(ipcout, buf, sizeof(ptrlong));
                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                            rjava.c:52:3: warning: ignoring return value of ‘read’, declared with attribute warn_unused_result [-Wunused-result]
                                                          read(resin, buf, sizeof(ptrlong) * 2);
                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                            gcc -std=gnu99 -o libjri.so Rengine.o jri.o Rcallbacks.o Rinit.o globals.o rjava.o  -shared -L/usr/lib/jvm/default-java/jre/lib/amd64/server -ljvm -Wl,--export-dynamic -fopenmp -Wl,-Bsymbolic-functions -Wl,-z,relro -L/usr/lib/R/lib -lR -lpcre -llzma -lbz2 -lz -lrt -ldl -lm -licuuc -licui18n
                                                          /usr/lib/jvm/default-java/bin/javac -target 1.6 -source 1.6 -d . ../package-info.java ../RFactor.java ../REXP.java ../RList.java ../Mutex.java ../RVector.java ../RBool.java ../RConsoleOutputStream.java ../Rengine.java ../RMainLoopCallbacks.java
                                                          warning: [options] bootstrap class path not set in conjunction with -source 1.6
                                                          Note: Some input files use unchecked or unsafe operations.
                                                          Note: Recompile with -Xlint:unchecked for details.
                                                          1 warning
                                                          /usr/lib/jvm/default-java/bin/jar fc JRI.jar org libjri.so
                                                          make[2]: Leaving directory '/tmp/RtmpPFMVuJ/R.INSTALL2cde4fdc77c/rJava/jri/src'
                                                          rm -f libjri.so
                                                          cp src/libjri.so libjri.so
                                                          /usr/lib/jvm/default-java/bin/javac -target 1.6 -source 1.6 -classpath src/JRI.jar -d examples examples/rtest.java
                                                          warning: [options] bootstrap class path not set in conjunction with -source 1.6
                                                          Note: examples/rtest.java uses or overrides a deprecated API.
                                                          Note: Recompile with -Xlint:deprecation for details.
                                                          1 warning
                                                          /usr/lib/jvm/default-java/bin/javac -target 1.6 -source 1.6 -classpath src/JRI.jar -d examples examples/rtest2.java
                                                          warning: [options] bootstrap class path not set in conjunction with -source 1.6
                                                          Note: examples/rtest2.java uses or overrides a deprecated API.
                                                          Note: Recompile with -Xlint:deprecation for details.
                                                          1 warning
                                                          make[1]: Leaving directory '/tmp/RtmpPFMVuJ/R.INSTALL2cde4fdc77c/rJava/jri'
                                                          installing via 'install.libs.R' to /home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/rJava
                                                          ** R
                                                          ** inst
                                                          ** preparing package for lazy loading
                                                          ** help
                                                          *** installing help indices
                                                          ** building package indices
                                                          ** testing if installed package can be loaded
                                                          * DONE (rJava)
                                                          * installing *source* package ‘XLConnectJars’ ...
                                                          ** package ‘XLConnectJars’ successfully unpacked and MD5 sums checked
                                                          ** R
                                                          ** inst
                                                          ** preparing package for lazy loading
                                                          ** help
                                                          *** installing help indices
                                                          ** building package indices
                                                          ** testing if installed package can be loaded
                                                          * DONE (XLConnectJars)
                                                          * installing *source* package ‘XLConnect’ ...
                                                          ** package ‘XLConnect’ successfully unpacked and MD5 sums checked
                                                          ** R
                                                          ** data
                                                          *** moving datasets to lazyload DB
                                                          ** demo
                                                          ** inst
                                                          ** preparing package for lazy loading
                                                          ** help
                                                          *** installing help indices
                                                          ** building package indices
                                                          ** installing vignettes
                                                          ** testing if installed package can be loaded
                                                          * DONE (XLConnect)
                                                          
                                                          The downloaded source packages are in
                                                          ‘/tmp/RtmpF7IMne/downloaded_packages’
                                                          > library(XLConnect)
                                                          Loading required package: XLConnectJars
                                                          XLConnect 0.2-15 by Mirai Solutions GmbH [aut],
                                                          Martin Studer [cre],
                                                          The Apache Software Foundation [ctb, cph] (Apache POI),
                                                          Graph Builder [ctb, cph] (Curvesapi Java library)
                                                          http://www.mirai-solutions.com
                                                          https://github.com/miraisolutions/xlconnect
                                                          > data.Q3 <- read.csv("~/Documents/BIOMETRY/week9/data.Q3.csv")
                                                          >   View(data.Q3)
                                                          > head(data.Q3)
                                                          Y         X
                                                          1 0.1032160 1.8972019
                                                          2 0.1388835 1.3592193
                                                          3 0.0000000 2.9140477
                                                          4 0.2356546 0.4460297
                                                          5 0.2177814 0.5941209
                                                          6 0.1033858 1.6765795
                                                          > library(outliers)
                                                          > out <- outlier(Dummy, logical=TRUE) Dummy[which(out[,], TRUE)]
                                                          Error: unexpected symbol in "out <- outlier(Dummy, logical=TRUE) Dummy"
                                                          > library(outliers)
                                                          > out <- outlier(Dummy, logical=TRUE), Dummy[which(out[,], TRUE)]
                                                          Error: unexpected ',' in "out <- outlier(Dummy, logical=TRUE),"
                                                          > library(outliers)
                                                          > out <- outlier(Dummy, logical=TRUE) Dummy[which(out[,], TRUE)]
                                                          Error: unexpected symbol in "out <- outlier(Dummy, logical=TRUE) Dummy"
                                                          > boxplot.stats(data.Q3)$out
                                                          Error in `[.data.frame`(x, order(x, na.last = na.last, decreasing = decreasing)) : 
                                                            undefined columns selected
                                                          > boxplot.stats(data.Q3$Y)$out
                                                          numeric(0)
                                                          > boxplot.stats(data.Q3$X)$out
                                                          numeric(0)
                                                          > q3lm <- lm(Y ~ X, data = data.Q3)
                                                          > > bwplot(Y ~ X, main = "Conditional Boxplot", data = data.Q3)
                                                          Error: unexpected '>' in ">"
                                                          > > plot(q3lm)
                                                          Error: unexpected '>' in ">"
                                                          > plot(q3lm)
                                                          Hit <Return> to see next plot: > bwplot(Y ~ X, main = "Conditional Boxplot", data = data.Q3)
                                                          Hit <Return> to see next plot: 
                                                            Hit <Return> to see next plot: 
                                                            Hit <Return> to see next plot: 
                                                            > 
                                                            > which.outlier(data.Q3, arr.ind = FALSE, useNames = TRUE)
                                                          Error in which.outlier(data.Q3, arr.ind = FALSE, useNames = TRUE) : 
                                                            could not find function "which.outlier"
                                                          > arrayInd(ind, .dim, .dimnames = NULL, useNames = FALSE)
                                                          Error in arrayInd(ind, .dim, .dimnames = NULL, useNames = FALSE) : 
                                                            object 'ind' not found
                                                          > which.outlier(data.Q3, useNames = TRUE)
                                                          Error in which.outlier(data.Q3, useNames = TRUE) : 
                                                            could not find function "which.outlier"
                                                          > arrayInd(ind, .dim, .dimnames = NULL, useNames = FALSE)
                                                          Error in arrayInd(ind, .dim, .dimnames = NULL, useNames = FALSE) : 
                                                            object 'ind' not found
                                                          > which.outlier(data.Q3)
                                                          Error in which.outlier(data.Q3) : could not find function "which.outlier"
                                                          > ?which
                                                          > which(outlier(data.Q3, opposite = FALSE, lo))
                                                          Error in FUN(X[[i]], ...) : object 'lo' not found
                                                          > which(outlier(data.Q3, opposite = FALSE, logical = FALSE)
                                                                  + 
                                                                    + 
                                                                    
                                                                    > which(outlier(data.Q3, opposite = FALSE, logical = FALSE)
                                                                            + 
                                                                              
                                                                              > which(outlier(data.Q3, opposite = FALSE, logical = FALSE)
                                                                                      + 
                                                                                        + 
                                                                                        + 
                                                                                        
                                                                                        > which(outlier(data.Q3$Y, opposite = FALSE, logical = FALSE)
                                                                                                + 
                                                                                                  
                                                                                                  > which(outlier(data.Q3$Y, opposite = FALSE, logical = FALSE))
                                                                                                Error in which(outlier(data.Q3$Y, opposite = FALSE, logical = FALSE)) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > which(outlier(data.Q3, opposite = FALSE, logical = FALSE))
                                                                                                Error in which(outlier(data.Q3, opposite = FALSE, logical = FALSE)) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > outlier(data.Q3, opposite = FALSE, logical = F)
                                                                                                Y X 
                                                                                                0 0 
                                                                                                > outlier(data.Q3, opposite = TRUE, logical = T)
                                                                                                Y     X
                                                                                                [1,] FALSE FALSE
                                                                                                [2,] FALSE FALSE
                                                                                                [3,] FALSE  TRUE
                                                                                                [4,] FALSE FALSE
                                                                                                [5,] FALSE FALSE
                                                                                                [6,] FALSE FALSE
                                                                                                [7,] FALSE FALSE
                                                                                                [8,] FALSE FALSE
                                                                                                [9,] FALSE FALSE
                                                                                                [10,] FALSE FALSE
                                                                                                [11,] FALSE FALSE
                                                                                                [12,] FALSE FALSE
                                                                                                [13,] FALSE FALSE
                                                                                                [14,] FALSE FALSE
                                                                                                [15,] FALSE FALSE
                                                                                                [16,] FALSE FALSE
                                                                                                [17,] FALSE FALSE
                                                                                                [18,] FALSE FALSE
                                                                                                [19,] FALSE FALSE
                                                                                                [20,] FALSE FALSE
                                                                                                [21,] FALSE FALSE
                                                                                                [22,] FALSE FALSE
                                                                                                [23,] FALSE FALSE
                                                                                                [24,] FALSE FALSE
                                                                                                [25,] FALSE FALSE
                                                                                                [26,] FALSE FALSE
                                                                                                [27,] FALSE FALSE
                                                                                                [28,] FALSE FALSE
                                                                                                [29,] FALSE FALSE
                                                                                                [30,] FALSE FALSE
                                                                                                [31,] FALSE FALSE
                                                                                                [32,] FALSE FALSE
                                                                                                [33,] FALSE FALSE
                                                                                                [34,] FALSE FALSE
                                                                                                [35,] FALSE FALSE
                                                                                                [36,] FALSE FALSE
                                                                                                [37,] FALSE FALSE
                                                                                                [38,] FALSE FALSE
                                                                                                [39,] FALSE FALSE
                                                                                                [40,] FALSE FALSE
                                                                                                [41,] FALSE FALSE
                                                                                                [42,] FALSE FALSE
                                                                                                [43,] FALSE FALSE
                                                                                                [44,] FALSE FALSE
                                                                                                [45,] FALSE FALSE
                                                                                                [46,] FALSE FALSE
                                                                                                [47,] FALSE FALSE
                                                                                                [48,] FALSE FALSE
                                                                                                [49,] FALSE FALSE
                                                                                                [50,] FALSE FALSE
                                                                                                [51,] FALSE FALSE
                                                                                                [52,]  TRUE FALSE
                                                                                                [53,] FALSE FALSE
                                                                                                [54,] FALSE FALSE
                                                                                                [55,] FALSE FALSE
                                                                                                [56,] FALSE FALSE
                                                                                                [57,] FALSE FALSE
                                                                                                [58,] FALSE FALSE
                                                                                                [59,] FALSE FALSE
                                                                                                [60,] FALSE FALSE
                                                                                                [61,] FALSE FALSE
                                                                                                [62,] FALSE FALSE
                                                                                                [63,] FALSE FALSE
                                                                                                [64,] FALSE FALSE
                                                                                                [65,] FALSE FALSE
                                                                                                [66,] FALSE FALSE
                                                                                                [67,] FALSE FALSE
                                                                                                [68,] FALSE FALSE
                                                                                                [69,] FALSE FALSE
                                                                                                [70,] FALSE FALSE
                                                                                                [71,] FALSE FALSE
                                                                                                [72,] FALSE FALSE
                                                                                                [73,] FALSE FALSE
                                                                                                [74,] FALSE FALSE
                                                                                                [75,] FALSE FALSE
                                                                                                [76,] FALSE FALSE
                                                                                                [77,] FALSE FALSE
                                                                                                [78,] FALSE FALSE
                                                                                                [79,] FALSE FALSE
                                                                                                [80,] FALSE FALSE
                                                                                                [81,] FALSE FALSE
                                                                                                [82,] FALSE FALSE
                                                                                                [83,] FALSE FALSE
                                                                                                [84,] FALSE FALSE
                                                                                                [85,] FALSE FALSE
                                                                                                [86,] FALSE FALSE
                                                                                                [87,] FALSE FALSE
                                                                                                [88,] FALSE FALSE
                                                                                                [89,] FALSE FALSE
                                                                                                [90,] FALSE FALSE
                                                                                                [91,] FALSE FALSE
                                                                                                [92,] FALSE FALSE
                                                                                                [93,] FALSE FALSE
                                                                                                [94,] FALSE FALSE
                                                                                                [95,] FALSE FALSE
                                                                                                [96,] FALSE FALSE
                                                                                                [97,] FALSE FALSE
                                                                                                [98,] FALSE FALSE
                                                                                                [99,] FALSE FALSE
                                                                                                [100,] FALSE FALSE
                                                                                                [101,] FALSE FALSE
                                                                                                [102,] FALSE FALSE
                                                                                                [103,] FALSE FALSE
                                                                                                [104,] FALSE FALSE
                                                                                                [105,] FALSE FALSE
                                                                                                [106,] FALSE FALSE
                                                                                                [107,] FALSE FALSE
                                                                                                [108,] FALSE FALSE
                                                                                                [109,] FALSE FALSE
                                                                                                [110,] FALSE FALSE
                                                                                                [111,] FALSE FALSE
                                                                                                [112,] FALSE FALSE
                                                                                                [113,] FALSE FALSE
                                                                                                [114,] FALSE FALSE
                                                                                                [115,] FALSE FALSE
                                                                                                [116,] FALSE FALSE
                                                                                                [117,] FALSE FALSE
                                                                                                [118,] FALSE FALSE
                                                                                                [119,] FALSE FALSE
                                                                                                [120,] FALSE FALSE
                                                                                                [121,] FALSE FALSE
                                                                                                [122,] FALSE FALSE
                                                                                                [123,] FALSE FALSE
                                                                                                [124,] FALSE FALSE
                                                                                                [125,] FALSE FALSE
                                                                                                [126,] FALSE FALSE
                                                                                                [127,] FALSE FALSE
                                                                                                [128,] FALSE FALSE
                                                                                                [129,] FALSE FALSE
                                                                                                [130,] FALSE FALSE
                                                                                                [131,] FALSE FALSE
                                                                                                [132,] FALSE FALSE
                                                                                                [133,] FALSE FALSE
                                                                                                [134,] FALSE FALSE
                                                                                                [135,] FALSE FALSE
                                                                                                [136,] FALSE FALSE
                                                                                                [137,] FALSE FALSE
                                                                                                [138,] FALSE FALSE
                                                                                                [139,] FALSE FALSE
                                                                                                [140,] FALSE FALSE
                                                                                                [141,] FALSE FALSE
                                                                                                [142,] FALSE FALSE
                                                                                                [143,] FALSE FALSE
                                                                                                [144,] FALSE FALSE
                                                                                                [145,] FALSE FALSE
                                                                                                [146,] FALSE FALSE
                                                                                                [147,] FALSE FALSE
                                                                                                [148,] FALSE FALSE
                                                                                                [149,] FALSE FALSE
                                                                                                [150,] FALSE FALSE
                                                                                                > which(data.Q3, arr.ind = F, useNa,)
                                                                                                Error in which(data.Q3, arr.ind = F, useNa, ) : unused argument ()
                                                                                                > which(data.Q3, arr.ind = F, useNames = T)
                                                                                                Error in which(data.Q3, arr.ind = F, useNames = T) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > which(data.Q3, arr.ind = F, useNames = F)
                                                                                                Error in which(data.Q3, arr.ind = F, useNames = F) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > which(data.Q3, arr.ind = T, useNames = F)
                                                                                                Error in which(data.Q3, arr.ind = T, useNames = F) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > which(data.Q3, arr.ind = T, useNames = T)
                                                                                                Error in which(data.Q3, arr.ind = T, useNames = T) : 
                                                                                                  argument to 'which' is not logical
                                                                                                > which(data.Q3)
                                                                                                Error in which(data.Q3) : argument to 'which' is not logical
                                                                                                > which(data.Q3$Y)
                                                                                                Error in which(data.Q3$Y) : argument to 'which' is not logical
                                                                                                > which.outlier(data.Q3, thr = 1.5, method = c("sd", "iq", "pc"), high = TRUE, low = TRUE)
                                                                                                Error in which.outlier(data.Q3, thr = 1.5, method = c("sd", "iq", "pc"),  : 
                                                                                                                         could not find function "which.outlier"
                                                                                                                       > ?which.outlier
                                                                                                                       No documentation for ‘which.outlier’ in specified packages and libraries:
                                                                                                                         you could try ‘??which.outlier’
                                                                                                                       > ??which.outlier
                                                                                                                       > outlier_values <- boxplot.stats(data.Q3)$out
                                                                                                                       Error in `[.data.frame`(x, order(x, na.last = na.last, decreasing = decreasing)) : 
                                                                                                                         undefined columns selected
                                                                                                                       > outlier_values <- boxplot.stats(data.Q3$Y)$out
                                                                                                                       > outlier_values
                                                                                                                       numeric(0)
                                                                                                                       > cooksd <- cooks.distance(q3lm)
                                                                                                                       > cooksd
                                                                                                                       1            2            3            4            5            6            7            8            9           10 
                                                                                                                       5.798631e-06 1.124530e-03 1.157930e-02 4.506399e-04 3.030041e-05 3.040060e-03 2.048684e-02 7.295645e-04 2.328437e-05 8.325360e-04 
                                                                                                                       11           12           13           14           15           16           17           18           19           20 
                                                                                                                       7.410197e-04 1.170281e-05 2.080267e-03 8.562070e-04 1.206506e-03 2.868543e-02 1.570486e-04 1.883060e-03 1.033273e-03 1.057107e-02 
                                                                                                                       21           22           23           24           25           26           27           28           29           30 
                                                                                                                       9.845638e-04 5.740645e-03 2.019789e-03 1.314420e-02 1.283215e-03 9.148775e-04 1.170808e-03 6.626986e-05 8.917511e-04 8.328708e-04 
                                                                                                                       31           32           33           34           35           36           37           38           39           40 
                                                                                                                       7.887898e-04 3.282094e-03 5.718804e-03 1.480528e-02 1.973871e-03 9.434428e-01 8.695799e-04 1.737793e-03 2.110403e-05 1.817949e-03 
                                                                                                                       41           42           43           44           45           46           47           48           49           50 
                                                                                                                       1.787431e-04 4.383538e-03 7.133324e-04 4.449737e-03 3.808831e-03 5.302087e-03 3.496102e-04 2.589233e-02 1.121540e-03 7.455662e-04 
                                                                                                                       51           52           53           54           55           56           57           58           59           60 
                                                                                                                       4.339732e-04 4.077013e-02 5.354612e-03 1.916771e-02 8.548464e-03 1.763881e-04 5.673380e-06 2.140332e-03 8.509774e-05 2.570066e-03 
                                                                                                                       61           62           63           64           65           66           67           68           69           70 
                                                                                                                       3.752827e-05 1.022046e-03 4.532313e-04 2.772094e-04 1.200050e-04 2.861311e-06 1.683186e-03 3.723117e-03 2.541165e-04 6.519076e-03 
                                                                                                                       71           72           73           74           75           76           77           78           79           80 
                                                                                                                       2.675161e-05 9.064891e-04 4.896662e-04 1.787689e-04 1.077986e-05 2.647356e-03 1.595705e-03 1.767049e-03 1.140182e-02 4.821600e-04 
                                                                                                                       81           82           83           84           85           86           87           88           89           90 
                                                                                                                       7.586599e-05 1.509283e-03 4.558829e-03 8.782650e-03 3.584322e-03 2.109620e-04 3.407585e-04 2.497125e-04 5.336356e-03 2.858314e-03 
                                                                                                                       91           92           93           94           95           96           97           98           99          100 
                                                                                                                       4.202259e-05 2.311386e-05 4.294374e-06 3.153109e-03 5.920159e-04 1.293149e-03 8.762853e-04 4.074919e-04 1.882209e-04 1.043480e-04 
                                                                                                                       101          102          103          104          105          106          107          108          109          110 
                                                                                                                       1.403931e-02 1.648107e-03 2.046260e-03 1.084760e-02 6.904763e-03 1.515777e-05 7.802004e-03 5.822710e-06 4.966073e-04 5.227956e-03 
                                                                                                                       111          112          113          114          115          116          117          118          119          120 
                                                                                                                       9.118240e-05 6.385560e-04 7.219754e-04 5.566328e-03 4.025433e-03 3.424800e-04 8.817320e-04 3.353424e-04 2.932015e-04 2.799853e-02 
                                                                                                                       121          122          123          124          125          126          127          128          129          130 
                                                                                                                       1.056710e-03 3.993795e-03 1.606827e-03 7.281123e-04 9.322735e-04 6.652284e-03 3.701477e-03 1.341567e-03 1.695953e-04 2.468532e-03 
                                                                                                                       131          132          133          134          135          136          137          138          139          140 
                                                                                                                       1.855227e-04 1.338144e-03 1.792240e-04 8.424631e-03 1.721209e-04 4.054639e-04 8.043280e-04 4.934819e-04 1.954140e-03 6.746263e-04 
                                                                                                                       141          142          143          144          145          146          147          148          149          150 
                                                                                                                       1.516909e-04 9.433789e-04 1.806830e-07 9.576999e-04 2.905662e-04 2.018687e-04 1.295608e-04 2.338239e-03 1.165994e-03 1.016904e-03 
                                                                                                                       > plot(cooksd)
                                                                                                                       > abline(h = 4*mean(coabline(h = 4*mean(cooksd, na.rm=T)
                                                                                                                                                    + 
                                                                                                                                                      
                                                                                                                                                      > abline(h = 4*mean(cooksd, na.rm=T), col="red")
                                                                                                                                                    > abline(h = 2*mean(cooksd, na.rm=T), col="red")
                                                                                                                                                    > influential <- as.numeric(names(cooksd)[(cooksd > 4*mean(cooksd, na.rm=T))])
                                                                                                                                                    > head(data.Q3[influential, ])
                                                                                                                                                    Y         X
                                                                                                                                                    36 0.025000 0.6000000
                                                                                                                                                    52 0.269689 0.4074132
                                                                                                                                                    > library(car)
                                                                                                                                                    Loading required package: carData
                                                                                                                                                    > library(outliers)
                                                                                                                                                    > car::outlierTest(q3lm)
                                                                                                                                                    rstudent unadjusted p-value Bonferonni p
                                                                                                                                                    36 -12.63076         3.1487e-25   4.7231e-23
                                                                                                                                                    > rm.outlier(data.Q3, fill = FALSE, median = FALSE, opposite = FALSE)
                                                                                                                                                    Y         X
                                                                                                                                                    1   0.103215963 1.8972019
                                                                                                                                                    2   0.138883504 1.3592193
                                                                                                                                                    3   0.235654589 2.9140477
                                                                                                                                                    4   0.217781425 0.4460297
                                                                                                                                                    5   0.103385762 0.5941209
                                                                                                                                                    6   0.189589213 1.6765795
                                                                                                                                                    7   0.142164487 1.5456794
                                                                                                                                                    8   0.090460162 1.5799095
                                                                                                                                                    9   0.099998113 2.0647046
                                                                                                                                                    10  0.164776603 2.0312394
                                                                                                                                                    11  0.101048750 1.1101948
                                                                                                                                                    12  0.122424151 1.9416585
                                                                                                                                                    13  0.113271107 1.4893687
                                                                                                                                                    14  0.154174192 1.6706720
                                                                                                                                                    15  0.227377443 1.4788467
                                                                                                                                                    16  0.118537413 1.0958180
                                                                                                                                                    17  0.136479727 1.6803604
                                                                                                                                                    18  0.193497699 1.3457970
                                                                                                                                                    19  0.227960858 0.9845342
                                                                                                                                                    20  0.108749538 0.3073069
                                                                                                                                                    21  0.151721814 1.7166975
                                                                                                                                                    22  0.112086683 1.0894692
                                                                                                                                                    23  0.182219389 1.9540877
                                                                                                                                                    24  0.122048885 0.7219389
                                                                                                                                                    25  0.070521157 1.8250144
                                                                                                                                                    26  0.126658188 2.1960892
                                                                                                                                                    27  0.140462614 1.4909215
                                                                                                                                                    28  0.146482034 1.4479331
                                                                                                                                                    29  0.095373214 1.5442718
                                                                                                                                                    30  0.177845451 1.8934727
                                                                                                                                                    31  0.117835119 0.9707593
                                                                                                                                                    32  0.216237026 1.4905943
                                                                                                                                                    33  0.157586228 0.8341715
                                                                                                                                                    34  0.070677680 1.7629651
                                                                                                                                                    35  0.025000000 2.1518145
                                                                                                                                                    36  0.146298053 0.6000000
                                                                                                                                                    37  0.149160641 1.2960934
                                                                                                                                                    38  0.111182516 1.5643297
                                                                                                                                                    39  0.031969868 1.7978441
                                                                                                                                                    40  0.142404684 2.6351401
                                                                                                                                                    41  0.056522248 1.5193048
                                                                                                                                                    42  0.174267904 2.2708108
                                                                                                                                                    43  0.202032731 1.0123807
                                                                                                                                                    44  0.172231002 1.0015104
                                                                                                                                                    45  0.160439064 0.9347442
                                                                                                                                                    46  0.167989604 1.0170670
                                                                                                                                                    47  0.250819171 1.2454124
                                                                                                                                                    48  0.109710855 1.9440575
                                                                                                                                                    49  0.108176550 1.9410078
                                                                                                                                                    50  0.058783532 2.3617008
                                                                                                                                                    51  0.269689022 0.4074132
                                                                                                                                                    52  0.058084803 2.2288702
                                                                                                                                                    53  0.224427160 0.9657870
                                                                                                                                                    54  0.193168711 1.2555294
                                                                                                                                                    55  0.162135869 1.2918352
                                                                                                                                                    56  0.101463579 1.9173114
                                                                                                                                                    57  0.158187487 1.1159955
                                                                                                                                                    58  0.121399880 1.6610962
                                                                                                                                                    59  0.058162268 2.2931655
                                                                                                                                                    60  0.109268878 1.8590718
                                                                                                                                                    61  0.066710309 2.2378735
                                                                                                                                                    62  0.118795756 1.8089883
                                                                                                                                                    63  0.134982433 1.6159865
                                                                                                                                                    64  0.128909214 1.5670624
                                                                                                                                                    65  0.127652148 1.6356244
                                                                                                                                                    66  0.189898546 0.8110364
                                                                                                                                                    67  0.202771546 0.9687898
                                                                                                                                                    68  0.141587496 1.4020085
                                                                                                                                                    69  0.208131081 0.9705162
                                                                                                                                                    70  0.126911363 1.6584230
                                                                                                                                                    71  0.186764120 1.0613503
                                                                                                                                                    72  0.118415995 1.6404001
                                                                                                                                                    73  0.060629734 2.3577655
                                                                                                                                                    74  0.099939414 1.9316480
                                                                                                                                                    75  0.176055797 1.2899805
                                                                                                                                                    76  0.131251781 1.4154765
                                                                                                                                                    77  0.083306436 1.9973672
                                                                                                                                                    78  0.001777183 2.8928091
                                                                                                                                                    79  0.154339003 1.4206755
                                                                                                                                                    80  0.109222302 1.8046341
                                                                                                                                                    81  0.127486111 1.7798184
                                                                                                                                                    82  0.027527009 2.6402700
                                                                                                                                                    83  0.208430572 1.0224946
                                                                                                                                                    84  0.116091486 1.4991810
                                                                                                                                                    85  0.086693032 2.0488232
                                                                                                                                                    86  0.110117088 1.8920778
                                                                                                                                                    87  0.141052362 1.5449636
                                                                                                                                                    88  0.210988647 0.8990967
                                                                                                                                                    89  0.195555841 0.7240503
                                                                                                                                                    90  0.148763951 1.4170709
                                                                                                                                                    91  0.062114688 2.3825044
                                                                                                                                                    92  0.107808134 1.8459744
                                                                                                                                                    93  0.183525293 1.2130440
                                                                                                                                                    94  0.164546309 1.3107883
                                                                                                                                                    95  0.063236204 2.2696390
                                                                                                                                                    96  0.139392703 1.6206601
                                                                                                                                                    97  0.076449284 2.1534343
                                                                                                                                                    98  0.155635403 1.3694975
                                                                                                                                                    99  0.212816178 0.6876645
                                                                                                                                                    100 0.185694087 1.4858079
                                                                                                                                                    101 0.106981685 1.6977316
                                                                                                                                                    102 0.120257991 1.5157794
                                                                                                                                                    103 0.171192631 1.5816932
                                                                                                                                                    104 0.189997847 1.2535974
                                                                                                                                                    105 0.202434660 0.7703028
                                                                                                                                                    106 0.215998090 0.8836818
                                                                                                                                                    107 0.114372913 1.7697411
                                                                                                                                                    108 0.096966929 2.0444764
                                                                                                                                                    109 0.163834483 1.5318652
                                                                                                                                                    110 0.095167911 1.9655242
                                                                                                                                                    111 0.104432940 1.7957994
                                                                                                                                                    112 0.174418461 1.0103115
                                                                                                                                                    113 0.213156229 0.8740632
                                                                                                                                                    114 0.181041925 0.8449956
                                                                                                                                                    115 0.107104177 1.7909399
                                                                                                                                                    116 0.229834401 0.4123037
                                                                                                                                                    117 0.107118779 1.9237795
                                                                                                                                                    118 0.158733475 1.3481980
                                                                                                                                                    119 0.219267190 0.2936287
                                                                                                                                                    120 0.150364195 1.2420695
                                                                                                                                                    121 0.102189120 1.6538020
                                                                                                                                                    122 0.080769808 2.0369485
                                                                                                                                                    123 0.122946260 1.5655817
                                                                                                                                                    124 0.177760569 0.9645530
                                                                                                                                                    125 0.198436874 1.1199403
                                                                                                                                                    126 0.137116703 1.7588485
                                                                                                                                                    127 0.185593444 1.1014753
                                                                                                                                                    128 0.156934072 1.3514060
                                                                                                                                                    129 0.028274152 2.6662115
                                                                                                                                                    130 0.165429999 1.2545932
                                                                                                                                                    131 0.180622026 1.1647500
                                                                                                                                                    132 0.188100132 0.9033910
                                                                                                                                                    133 0.236145483 0.6066001
                                                                                                                                                    134 0.090765937 2.0853329
                                                                                                                                                    135 0.167814141 1.2535567
                                                                                                                                                    136 0.155483703 1.2035301
                                                                                                                                                    137 0.198353175 0.8919162
                                                                                                                                                    138 0.216074447 0.5316124
                                                                                                                                                    139 0.120141640 1.8111702
                                                                                                                                                    140 0.180225254 1.0750662
                                                                                                                                                    141 0.074386655 2.1472968
                                                                                                                                                    142 0.158335541 1.2788490
                                                                                                                                                    143 0.095637777 2.0826914
                                                                                                                                                    144 0.180160472 1.0931505
                                                                                                                                                    145 0.170273959 1.0950542
                                                                                                                                                    146 0.177559325 1.1030376
                                                                                                                                                    147 0.030152185 2.6459687
                                                                                                                                                    148 0.093978292 1.8904578
                                                                                                                                                    149 0.097716803 1.8522469
                                                                                                                                                    > mean(data.Q3)
                                                                                                                                                    [1] NA
                                                                                                                                                    Warning message:
                                                                                                                                                      In mean.default(data.Q3) : argument is not numeric or logical: returning NA
                                                                                                                                                    > mean(data.Q3$Y)
                                                                                                                                                    [1] 0.1398813
                                                                                                                                                    > which.outlier(data.Q3, thr = 2, method = c("sd"), high = TRUE, low = TRUE)
                                                                                                                                                    Error in which.outlier(data.Q3, thr = 2, method = c("sd"), high = TRUE,  : 
                                                                                                                                                                             could not find function "which.outlier"
                                                                                                                                                                           > io <- which.outlier(data.Q3, thr = 2, method = c("sd"), high = TRUE, low = TRUE)
                                                                                                                                                                           Error in which.outlier(data.Q3, thr = 2, method = c("sd"), high = TRUE,  : 
                                                                                                                                                                                                    could not find function "which.outlier"
                                                                                                                                                                                                  > install.packages("readx")
                                                                                                                                                                                                  Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
                                                                                                                                                                                                  (as ‘lib’ is unspecified)
                                                                                                                                                                                                  Warning in install.packages :
                                                                                                                                                                                                    package ‘readx’ is not available (for R version 3.4.2)
                                                                                                                                                                                                  > hist(data.Q3)
                                                                                                                                                                                                  Error in hist.default(data.Q3) : 'x' must be numeric
                                                                                                                                                                                                  > hist(data.Q3$Y)
                                                                                                                                                                                                  > hist(data.Q3$X)
                                                                                                                                                                                                  > install.packages("readxl")
                                                                                                                                                                                                  Error in install.packages : Updating loaded packages
                                                                                                                                                                                                  > install.packages("readxl")
                                                                                                                                                                                                  Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
                                                                                                                                                                                                  (as ‘lib’ is unspecified)
                                                                                                                                                                                                  trying URL 'https://cran.rstudio.com/src/contrib/readxl_1.1.0.tar.gz'
                                                                                                                                                                                                  Content type 'application/x-gzip' length 2036680 bytes (1.9 MB)
                                                                                                                                                                                                  ==================================================
                                                                                                                                                                                                    downloaded 1.9 MB
                                                                                                                                                                                                  
                                                                                                                                                                                                  * installing *source* package ‘readxl’ ...
                                                                                                                                                                                                  ** package ‘readxl’ successfully unpacked and MD5 sums checked
                                                                                                                                                                                                  ** libs
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c XlsWorkBook.cpp -o XlsWorkBook.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c XlsWorkSheet.cpp -o XlsWorkSheet.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c XlsxWorkBook.cpp -o XlsxWorkBook.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c XlsxWorkSheet.cpp -o XlsxWorkSheet.o
                                                                                                                                                                                                  gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c endian.c -o endian.o
                                                                                                                                                                                                  gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c ole.c -o ole.o
                                                                                                                                                                                                  gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c xls.c -o xls.o
                                                                                                                                                                                                  gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c xlstool.c -o xlstool.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG -Iunix -I. -fvisibility=hidden -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c zip.cpp -o zip.o
                                                                                                                                                                                                  g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o readxl.so RcppExports.o XlsWorkBook.o XlsWorkSheet.o XlsxWorkBook.o XlsxWorkSheet.o endian.o ole.o xls.o xlstool.o zip.o -L/usr/lib/R/lib -lR
                                                                                                                                                                                                  installing to /home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/readxl/libs
                                                                                                                                                                                                  ** R
                                                                                                                                                                                                  ** inst
                                                                                                                                                                                                  ** preparing package for lazy loading
                                                                                                                                                                                                  ** help
                                                                                                                                                                                                  *** installing help indices
                                                                                                                                                                                                  ** building package indices
                                                                                                                                                                                                  ** installing vignettes
                                                                                                                                                                                                  ** testing if installed package can be loaded
                                                                                                                                                                                                  * DONE (readxl)
                                                                                                                                                                                                  
                                                                                                                                                                                                  The downloaded source packages are in
                                                                                                                                                                                                  ‘/tmp/RtmpF7IMne/downloaded_packages’
                                                                                                                                                                                                  > install.packages("scales")
                                                                                                                                                                                                  Installing package into ‘/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4’
                                                                                                                                                                                                  (as ‘lib’ is unspecified)
                                                                                                                                                                                                  trying URL 'https://cran.rstudio.com/src/contrib/scales_0.5.0.tar.gz'
                                                                                                                                                                                                  Content type 'application/x-gzip' length 59867 bytes (58 KB)
                                                                                                                                                                                                  ==================================================
                                                                                                                                                                                                    downloaded 58 KB
                                                                                                                                                                                                  
                                                                                                                                                                                                  * installing *source* package ‘scales’ ...
                                                                                                                                                                                                  ** package ‘scales’ successfully unpacked and MD5 sums checked
                                                                                                                                                                                                  ** libs
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG  -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c RcppExports.cpp -o RcppExports.o
                                                                                                                                                                                                  g++  -I/usr/share/R/include -DNDEBUG  -I"/home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include"    -fpic  -g -O2 -fdebug-prefix-map=/build/r-base-1q72bO/r-base-3.4.2=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c colors.cpp -o colors.o
                                                                                                                                                                                                  g++ -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o scales.so RcppExports.o colors.o -L/usr/lib/R/lib -lR
                                                                                                                                                                                                  installing to /home/swaggyt/R/x86_64-pc-linux-gnu-library/3.4/scales/libs
                                                                                                                                                                                                  ** R
                                                                                                                                                                                                  ** preparing package for lazy loading
                                                                                                                                                                                                  ** help
                                                                                                                                                                                                  *** installing help indices
                                                                                                                                                                                                  ** building package indices
                                                                                                                                                                                                  ** testing if installed package can be loaded
                                                                                                                                                                                                  * DONE (scales)
                                                                                                                                                                                                  
                                                                                                                                                                                                  The downloaded source packages are in
                                                                                                                                                                                                  ‘/tmp/RtmpF7IMne/downloaded_packages’
                                                                                                                                                                                                  > data.Q3treatment <- data.Q3
                                                                                                                                                                                                  > data.Q3treated <- rm.outlier(data.Q3, fill = FALSE, median = FALSE, opposite = FALSE)
                                                                                                                                                                                                  > plot(data.Q3treated)
                                                                                                                                                                                                  > q3lmtreated <- lm(Y ~ X, data = data.Q3treated)
                                                                                                                                                                                                  > plot(q3lmtreated)
                                                                                                                                                                                                  Hit <Return> to see next plot: 
                                                                                                                                                                                                    Hit <Return> to see next plot: 
                                                                                                                                                                                                    Hit <Return> to see next plot: 
                                                                                                                                                                                                    Hit <Return> to see next plot: 
                                                                                                                                                                                                    > variable <- c("Y", "X")
                                                                                                                                                                                                  > outliers <- c()
                                                                                                                                                                                                  > for(i in vars){
                                                                                                                                                                                                    + 
                                                                                                                                                                                                      
                                                                                                                                                                                                      > for(i in vars)
                                                                                                                                                                                                        + 
                                                                                                                                                                                                      
                                                                                                                                                                                                      > for(i in vars){}
                                                                                                                                                                                                    Error in vars : object 'vars' not found
                                                                                                                                                                                                    > for(i in var){
                                                                                                                                                                                                      + 
                                                                                                                                                                                                        
                                                                                                                                                                                                        > for(i in var){}
                                                                                                                                                                                                      Error in for (i in var) { : invalid for() loop sequence
                                                                                                                                                                                                        > for(i in variable){
                                                                                                                                                                                                          + 
                                                                                                                                                                                                            
                                                                                                                                                                                                            > for(i in variable){}
                                                                                                                                                                                                          > max <- quantile(data.Q3treatment[,i],0.75, na.rm=TRUE) + (IQR(data.Q3treatment[,i], na.rm=TRUE) * 1.5 )
                                                                                                                                                                                                          > min <- quantile(data.Q3treatment[,i],0.25, na.rm=TRUE) - (IQR(data.Q3treatment[,i], na.rm=TRUE) * 1.5 )
                                                                                                                                                                                                          > idx <- which(data.Q3treatment[,i] < min | data.Q3treatment[,i] > max)
                                                                                                                                                                                                          > print(paste(i, length(idx), sep=''))
                                                                                                                                                                                                          [1] "X0"
                                                                                                                                                                                                          > outliers <- c(Outliers, idx) 
                                                                                                                                                                                                          Error: object 'Outliers' not found
                                                                                                                                                                                                          > outliers <- c(outliers, idx) 
                                                                                                                                                                                                          > outliers <- sort(outliers)
                                                                                                                                                                                                          > outliers
                                                                                                                                                                                                          integer(0)
                                                                                                                                                                                                          > data.frame(-, 36)
                                                                                                                                                                                                          Error: unexpected ',' in "data.frame(-,"
                                                                                                                                                                                                          > ??data.frame
                                                                                                                                                                                                          > data.Q3treatment <- data.Q3(minus row 36)
                                                                                                                                                                                                          Error: unexpected symbol in "data.Q3treatment <- data.Q3(minus row"
                                                                                                                                                                                                          > data.Q3treatment <- data.Q3[-36,]
                                                                                                                                                                                                          > plot(data.Q3treatment)
                                                                                                                                                                                                          > plot(Y ~ X, data=data.Q3treatment)
                                                                                                                                                                                                          > q3lmtreatment <- lm(Y ~ X, data = data.Q3treatment)
                                                                                                                                                                                                          > plot(q3lmtreatment)
                                                                                                                                                                                                          Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            > summary(q3lmtreatment)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Call:
                                                                                                                                                                                                            lm(formula = Y ~ X, data = data.Q3treatment)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residuals:
                                                                                                                                                                                                            Min        1Q    Median        3Q       Max 
                                                                                                                                                                                                          -0.032017 -0.010528 -0.001604  0.008494  0.053526 
                                                                                                                                                                                                          
                                                                                                                                                                                                          Coefficients:
                                                                                                                                                                                                            Estimate Std. Error t value Pr(>|t|)    
                                                                                                                                                                                                          (Intercept)  0.278305   0.003676    75.7   <2e-16 ***
                                                                                                                                                                                                            X           -0.092026   0.002307   -39.9   <2e-16 ***
                                                                                                                                                                                                            ---
                                                                                                                                                                                                            Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residual standard error: 0.01549 on 147 degrees of freedom
                                                                                                                                                                                                          Multiple R-squared:  0.9154,	Adjusted R-squared:  0.9149 
                                                                                                                                                                                                          F-statistic:  1592 on 1 and 147 DF,  p-value: < 2.2e-16
                                                                                                                                                                                                          
                                                                                                                                                                                                          > summary(q3lmtreated)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Call:
                                                                                                                                                                                                            lm(formula = Y ~ X, data = data.Q3treated)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residuals:
                                                                                                                                                                                                            Min        1Q    Median        3Q       Max 
                                                                                                                                                                                                          -0.112340 -0.019383 -0.002131  0.016429  0.190025 
                                                                                                                                                                                                          
                                                                                                                                                                                                          Coefficients:
                                                                                                                                                                                                            Estimate Std. Error t value Pr(>|t|)    
                                                                                                                                                                                                          (Intercept)  0.241774   0.009185   26.32   <2e-16 ***
                                                                                                                                                                                                            X           -0.067310   0.005760  -11.69   <2e-16 ***
                                                                                                                                                                                                            ---
                                                                                                                                                                                                            Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residual standard error: 0.03807 on 147 degrees of freedom
                                                                                                                                                                                                          Multiple R-squared:  0.4815,	Adjusted R-squared:  0.478 
                                                                                                                                                                                                          F-statistic: 136.5 on 1 and 147 DF,  p-value: < 2.2e-16
                                                                                                                                                                                                          
                                                                                                                                                                                                          > summary(q3lm)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Call:
                                                                                                                                                                                                            lm(formula = Y ~ X, data = data.Q3)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residuals:
                                                                                                                                                                                                            Min        1Q    Median        3Q       Max 
                                                                                                                                                                                                          -0.193353 -0.010115 -0.000862  0.008538  0.054632 
                                                                                                                                                                                                          
                                                                                                                                                                                                          Coefficients:
                                                                                                                                                                                                            Estimate Std. Error t value Pr(>|t|)    
                                                                                                                                                                                                          (Intercept)  0.271265   0.005230   51.87   <2e-16 ***
                                                                                                                                                                                                            X           -0.088187   0.003291  -26.80   <2e-16 ***
                                                                                                                                                                                                            ---
                                                                                                                                                                                                            Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residual standard error: 0.0223 on 148 degrees of freedom
                                                                                                                                                                                                          Multiple R-squared:  0.8291,	Adjusted R-squared:  0.828 
                                                                                                                                                                                                          F-statistic: 718.1 on 1 and 148 DF,  p-value: < 2.2e-16
                                                                                                                                                                                                          
                                                                                                                                                                                                          > ggplot(data.Q3treatment, aes(x=X, y=Y)) + geom_point(size=2, shape=25) + geom_smooth(method=lm) + labs(title = "                                                                           Y vs X") + stat_ellipse()
                                                                                                                                                                                                          Error in ggplot(data.Q3treatment, aes(x = X, y = Y)) : 
                                                                                                                                                                                                            could not find function "ggplot"
                                                                                                                                                                                                          > library(ggplot2)
                                                                                                                                                                                                          Want to understand how all the pieces fit together? Buy the ggplot2 book: http://ggplot2.org/book/
                                                                                                                                                                                                            > ggplot(data.Q3treatment, aes(x=X, y=Y)) + geom_point(size=2, shape=25) + geom_smooth(method=lm) + labs(title = "                                                                           Y vs X") + stat_ellipse()
                                                                                                                                                                                                          > data.Q32treatment <- data.Q3treatment[-52,]
                                                                                                                                                                                                          > q3lmtreatment2 <- lm(Y ~ X, data = data.Q32treatment)
                                                                                                                                                                                                          > summary(q3lmtreatment2)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Call:
                                                                                                                                                                                                            lm(formula = Y ~ X, data = data.Q32treatment)
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residuals:
                                                                                                                                                                                                            Min        1Q    Median        3Q       Max 
                                                                                                                                                                                                          -0.031819 -0.010639 -0.001344  0.008291  0.053410 
                                                                                                                                                                                                          
                                                                                                                                                                                                          Coefficients:
                                                                                                                                                                                                            Estimate Std. Error t value Pr(>|t|)    
                                                                                                                                                                                                          (Intercept)  0.278034   0.003687   75.41   <2e-16 ***
                                                                                                                                                                                                            X           -0.091775   0.002321  -39.54   <2e-16 ***
                                                                                                                                                                                                            ---
                                                                                                                                                                                                            Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                                                                                                                                          
                                                                                                                                                                                                          Residual standard error: 0.0155 on 146 degrees of freedom
                                                                                                                                                                                                          Multiple R-squared:  0.9146,	Adjusted R-squared:  0.914 
                                                                                                                                                                                                          F-statistic:  1564 on 1 and 146 DF,  p-value: < 2.2e-16
                                                                                                                                                                                                          
                                                                                                                                                                                                          > plot(q3lmtreatment2)
                                                                                                                                                                                                          Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            Hit <Return> to see next plot: 
                                                                                                                                                                                                            > hist(data.Q3treatment)
                                                                                                                                                                                                          Error in hist.default(data.Q3treatment) : 'x' must be numeric
                                                                                                                                                                                                          > hist(data.Q3treatment$X)
                                                                                                                                                                                                          > hist(data.Q3treatment$Y)                                                          
 