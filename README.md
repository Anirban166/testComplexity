<p align = "center">
<img width = "95%" height = "auto" src = "Images/TransparentLogoV5.png">
</p>

<p align = "center">
    <a href = "https://travis-ci.com/github/Anirban166/testComplexity">
    <img src = "https://api.travis-ci.com/Anirban166/testComplexity.svg?branch=master"
         alt = "Build status (Travis CI)"></a>
    <a href = "https://codecov.io/gh/Anirban166/testComplexity?branch=master">    
    <img src = "https://codecov.io/gh/Anirban166/testComplexity/branch/master/graph/badge.svg"
         alt = "Code Coverage (covr/codecov)"></a>
    <a href = "https://summerofcode.withgoogle.com/archive/2020/projects/5767451238727680/">
    <img src = "https://img.shields.io/badge/Google-Funded-success?style=flat&logo=Google"
         alt = "GSoC project"></a>
    <a href = "https://anirban166.github.io/testComplexity/">
    <img src = "https://img.shields.io/badge/Website-pkgdown-green?style=flat"
         alt = "Website"></a>
    <a href = "https://youtu.be/H4uefLb8zcQ">
    <img src = "https://img.shields.io/badge/Demo-red?style=flat&logo=YouTube"
         alt = "YouTube screencast"></a>   
    <a href = "https://www.r-project.org/">
    <img src = "https://img.shields.io/badge/100%25--blue?style=flat&logo=R"
         alt = "The R project for statistical computing"></a>
    <a href = "https://github.com/Anirban166/testComplexity/blob/master/LICENSE.md">
    <img src = "https://img.shields.io/badge/License-MIT-black?style=flat"
         alt = "GitHub License"></a>
</p> 

<div align="center">
    
| <a href = "#abstract">Abstract</a> | <a href = "#installation">Installation</a> | <a href = "#function-map">Functions</a> | <a href = "#usage">Usage</a> | <a href = "#plotting">Plotting</a> | <a href = "#benchmarking">Benchmarking</a> | <a href = "#testing">Testing</a> |
|---|---|---|---|---|---|---|

</div>
        
---
<h2 align = "center">
Abstract
</h2>

R package developers traditionally rely on ad-hoc benchmarking (empirical timings and visual plots) to understand their code's asymptotic performance. We lack a framework for systematically testing the computational complexity of a function, which is crucial for identifying and implementing speed improvements in R code.

**testComplexity** attempts to address this by providing a suite of [functions](https://github.com/Anirban166/testComplexity/tree/master/R) for asymptotic complexity classification.

Since algorithms are used in every sphere of research, this package potentially caters to all variants of R-users. It has been specifically tested on ones ranging from changepoint detection and sorting to constrained optimal segmentation and partitioning, besides common base R functions such as `substring` and `gregexpr`.

<h2 align = "center">
Installation
</h2>

Use `devtools` or `remotes` to fetch the package from this repository:
```r
if(!require(devtools)) install.packages("devtools")
devtools::install_github("Anirban166/testComplexity")
```
```r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("Anirban166/testComplexity")
```

<h2 align = "center">
Function Map
</h2>

```r
testComplexity                              @ returns              @ type                    @ commit-branch(es) 
├──> asymptoticTimings                    : data.frame             timings quantifier        master
│    ├──> asymptoticTimeComplexityClass   :   ├──> string          ↑ complexity classifier   master
│    └──> plotTimings                     :   └──> ggplot object   ↑ plotter                 master/Plotfunc
│
├──> asymptoticMemoryUsage                : data.frame             memory-usage quantifier   Memtest
│    ├──> asymptoticMemoryComplexityClass :   ├──> string          ↑ complexity classifier   Memtest
│    └──> plotMemoryUsage                 :   └──> ggplot object   ↑ plotter                 Memtest/Plotfunc
│
├──> asymptoticComplexityClass            : string                 complexity classifier     Generalizedcomplexity
│    └──> asymptoticComplexityClassifier  :   ↑ string             ↑ complexity classifier   Generalizedcomplexity
│
├──> expect_complexity_class              : -/-                    test function             Testfunc
│    └──> expect_time_complexity          : -/-                    ↑  test function          Testfunc
│         ├──> expect_linear_time         : -/-                    ↑↑ test function          Testfunc
│         ├──> expect_loglinear_time      : -/-                    ↑↑ test function          Testfunc
│         └──> expect_quadratic_time      : -/-                    ↑↑ test function          Testfunc
│
└──> testthat                                                                                
     ├──> testsfortestComplexity                                   unit-tester               All branches
     ├──> testsforConstrainedchangepointmodelalgos                 unit-tester               Testfunc
     └──> testsforRegularfunctions                                 unit-tester               Testfunc
```

<h2 align = "center">
Usage
</h2>

To get started, please check the [general vignette](https://anirban166.github.io/testComplexity/articles/testComplexity.html) which highlights all features, categorizes the different functions available, and describes their functionality through textual elucidations and a running example case.

For a quick overview of the main functionality (obtaining quantified benchmarks and subsequently computing the time/memory complexity class), please check the examples below.

- To obtain the benchmarked timings/memory-allocations against specified data sizes, pass the required algorithm as a function of `N` to `asymptoticTimings()`/`asymptoticMemoryUsage()`: <br>
```r
library(data.table)
# Example 1 | Applying the bubble sort algorithm to a sample of 100 elements: (expected -> quadratic time & constant memory complexity)
bubble.sort <- function(elements.vec) { 
  n <- length(elements.vec)
  for(i in 1:(n - 1)) {
    for(j in 1:(n - i)) {
      if(elements.vec[j + 1] < elements.vec[j]) { 
        temp <- elements.vec[j]
        elements.vec[j] <- elements.vec[j + 1]
        elements.vec[j + 1] <- temp
      }
    }
  }
  return(elements.vec)
}

df.bubble.time <- asymptoticTimings(bubble.sort(sample(1:100, N, replace = TRUE)), data.sizes = 10^seq(1, 3, by = 0.5))
data.table(df.bubble.time)
      Timings Data sizes
  1:    91902         10
  2:    39402         10
  3:    34701         10
  4:    33101         10
  5:    33201         10
 ---                    
496: 64490501       1000
497: 59799101       1000
498: 63452200       1000
499: 62807201       1000
500: 59757102       1000
                  
df.bubble.memory <- asymptoticMemoryUsage(bubble.sort(sample(1:100, N, replace = TRUE)), data.sizes = 10^seq(1, 3, by = 0.1))
data.table(df.bubble.memory)
    Memory usage Data sizes
 1:        87800   10.00000
 2:         2552   12.58925
 3:         2552   15.84893
 4:         2552   19.95262
 5:         2552   25.11886
 ---                    
17:         7472  398.10717
18:         8720  501.18723
19:        10256  630.95734
20:        12224  794.32823
21:        14696 1000.00000
```
```r
# Example 2 | Testing PeakSegPDPA, an algorithm for constrained changepoint detection: (expected -> log-linear time and memory complexity)
data.vec <- rpois(N, 1)
df.PDPA.time <- asymptoticTimings(PeakSegOptimal::PeakSegPDPA(count.vec = data.vec, max.segments = 3L), data.sizes = 10^seq(1, 4, by = 0.1))
data.table(df.PDPA.time)
       Timings Data sizes
  1:    248701         10
  2:    120302         10
  3:    125701         10
  4:    133301         10
  5:    146500         10
 ---                     
696: 405597501      10000
697: 408335001      10000
698: 338544401      10000
699: 404081901      10000
700: 399575501      10000

df.PDPA.memory <- asymptoticMemoryUsage(PeakSegOptimal::PeakSegPDPA(count.vec = data.vec, max.segments = 3L), data.sizes = 10^seq(1, 4, by = 0.1))
data.table(df.PDPA.memory)
    Memory usage Data sizes
 1:         6256   10.00000
 2:         7024   12.58925
 3:         7432   15.84893
 4:         8560   19.95262
 5:         9496   25.11886
 --- 
25:       447792 2511.88643
26:       562336 3162.27766
27:       706512 3981.07171
28:       887792 5011.87234
29:      1116240 6309.57344
```
- To estimate the corresponding time/memory complexity class, pass the obtained data frame onto `asymptoticTimeComplexityClass()`/`asymptoticMemoryComplexityClass()`: <br>
```r
# Example 1 | Applying the bubble sort algorithm to a sample of 100 elements: (expected -> quadratic time & constant memory complexity)
asymptoticTimeComplexityClass(df.bubble.time)
[1] "quadratic"
asymptoticMemoryComplexityClass(df.bubble.memory)
[1] "constant"
```
```r
# Example 2 | Testing PeakSegPDPA, an algorithm for constrained changepoint detection: (expected -> log-linear time and memory complexity)
asymptoticTimeComplexityClass(df.PDPA.time)
[1] "loglinear"
asymptoticMemoryComplexityClass(df.PDPA.memory)
[1] "loglinear"
```
- Combine the functions if you only require the complexity class: <br>
```r
# Example 3 | Testing the time complexity of the quick sort algorithm: (expected -> log-linear time complexity)
asymptoticTimeComplexityClass(asymptoticTimings(sort(sample(1:100, N, replace = TRUE), method = "quick" , index.return = TRUE), data.sizes = 10^seq(1, 3, by = 0.5)))
[1] "loglinear"
```
```r
# Example 4 | Allocating a square matrix (N*N dimensions): (expected -> quadratic memory complexity)
asymptoticMemoryComplexityClass(asymptoticMemoryUsage(matrix(data = N:N, nrow = N, ncol = N), data.sizes = 10^seq(1, 3, by = 0.1)))
[1] "quadratic"
```
Check [this screencast](https://youtu.be/H4uefLb8zcQ) for a demonstration of time complexity testing on different sorting algorithms over a test session.

For examples with functions from selected packages, please check the table in the [testing section](#testing).

<h2 align = "center">
Plotting
</h2>

For obtaining a visual description of the trends followed between runtimes/memory-usage vs data sizes in order to visually diagnose/verify the complexity result(s), simple plots can be crafted. They are roughly grouped into:

- **Single Plots** <br>
Individual plots can be obtained by passing the data frame returned by the quantifying functions to `plotTimings()`/`plotMemoryUsage()` for time/memory cases respectively: <br>
```r
# Timings plot for PeakSegDP::cDPA
df <- asymptoticTimings(PeakSegDP::cDPA(rpois(N, 1), rep(1, length(rpois(N, 1))), 3L), data.sizes = 10^seq(1, 4))
plotTimings(df.time, titles = list("Timings", "PeakSegDP::cDPA"), line.color = "#ffec1b", point.color = "#ffec1b", line.size = 1, point.size = 1.5)
# Equivalent ggplot object:
df <- asymptoticTimings(PeakSegDP::cDPA(rpois(data.sizes, 1), rep(1, length(rpois(data.sizes, 1))), 3L), data.sizes = 10^seq(1, 4))
ggplot(df, aes(x = `Data sizes`, y = Timings)) + geom_point(color = ft_cols$yellow, size = 1.5) + geom_line(color = ft_cols$yellow, size = 1) + labs(x = "Data sizes", y = "Runtime (in nanoseconds)") + scale_x_log10() + scale_y_log10() + ggtitle("Timings", "PeakSegDP::cDPA") + hrbrthemes::theme_ft_rc()
```
```r
# Memory Usage plot for PeakSegDP::cDPA
df <- asymptoticMemoryUsage(PeakSegDP::cDPA(rpois(N, 1), rep(1, length(rpois(N, 1))), 3L), data.sizes = 10^seq(1, 6, by = 0.1))
plotMemoryUsage(df.memory, titles = list("Memory Usage", "PeakSegDP::cDPA"), line.color = "#ffec1b", point.color = "#ffec1b", line.size = 1, point.size = 2) 
# Equivalent ggplot object:
ggplot(df, aes(x = `Data sizes`, y = `Memory usage`)) + geom_point(color = ft_cols$yellow, size = 2) + geom_line(color = ft_cols$yellow, size = 1) labs(x = "Data sizes", y = "Memory usage (in bytes)") + scale_x_log10() + scale_y_log10() + ggtitle("Memory Usage", "PeakSegDP::cDPA") + hrbrthemes::theme_ft_rc()
```
<img width = "100%" src = "Images/timememorycDPA.png"> <br>
- **Comparison Plots** <br>
In order to visually compare different algorithms based on the benchmarked metrics returned as a data frame by the quantifiers, one can appropriately add a third column (to help distinguish by aesthetics based on it) with a unique value for each of the data frames, combine them using an `rbind()` and then plot the resultant data frame using suitable aesthetics, geometry, scale, labels/titles etc. via a ggplot: <br>
```r
df.substring <- asymptoticTimings(substring(paste(rep("A", N), collapse = ""), 1:N, 1:N), data.sizes = 10^seq(1, 4, by = 0.5))
asymptoticTimeComplexityClass(df.substring)
[1] "linear"
df.PeakSegPDPA <- asymptoticTimings(PeakSegOptimal::PeakSegPDPA(rpois(N, 1),rep(1, length(rpois(N, 1))), 3L), data.sizes = 10^seq(1, 4, by = 0.5), max.seconds = 1)
asymptoticTimeComplexityClass(df.PeakSegPDPA)
[1] "loglinear"
df.cDPA <- asymptoticTimings(PeakSegDP::cDPA(rpois(N, 1), rep(1, length(rpois(N, 1))), 3L), data.sizes = 10^seq(1, 4, by = 0.5), max.seconds = 5)
asymptoticTimeComplexityClass(df.cDPA)
[1] "quadratic"
df.gregexpr <- asymptoticTimings(gregexpr("a", paste(collapse = "", rep("ab", N)), perl = TRUE), data.sizes = 10^seq(1, 4, by = 0.5))
asymptoticTimeComplexityClass(df.gregexpr)
[1] "linear"
df.fpop <- asymptoticTimings(fpop::Fpop(rnorm(N), 1), data.sizes = 10^seq(1, 4, by = 0.5))
asymptoticTimeComplexityClass(df.fpop)
[1] "loglinear"
df.opart <- asymptoticTimings(opart::opart_gaussian(rnorm(N), 1), data.sizes = 10^seq(1, 4, by = 0.5))
asymptoticTimeComplexityClass(df.opart)
[1] "quadratic"
        
df.substring$expr = "substring"
df.PeakSegPDPA$expr = "PeakSegPDPA"
df.cDPA$expr = "cDPA"
df.gregexpr$expr = "gregexpr"
df.fpop$expr = "fpop"
df.opart$expr = "opart"
        
plot.df <- rbind(df.substring, df.PeakSegPDPA, df.cDPA, df.gregexpr, df.fpop, df.opart)
ggplot(plot.df, aes(x = `Data sizes`, y = Timings)) + geom_point(aes(color = expr)) + geom_line(aes(color = expr)) + labs(x = "Data sizes", y = "Runtime (in nanoseconds)") + scale_x_log10() + scale_y_log10() + ggtitle("Timings comparison plot", subtitle = "Linear vs Log-linear vs Quadratic complexities") + ggthemes::theme_pander()
```
<img width = "100%" src = "Images/cp2.png"> <br>

Including more functions (if applicable) and increasing the number of data sizes can lead to a more comprehensive outlook: <br>

<img width = "100%" src = "Images/cp.png"> <br>
- **Generalized Linear Model based Plots** <br>
`ggfortify` (an extension of `ggplot2`) can be used to produce diagnostic plots for generalized linear models with the same formulae as used in the complexity classification functions: <br>
```r
library(ggfortify)
df <- asymptoticTimings(PeakSegDP::cDPA(rpois(N, 1), rep(1, length(rpois(N, 1))), 3L), data.sizes = 10^seq(1, 4 by = 0.1))
glm.plot.obj <- glm(Timings~`Data sizes`, data = df)
ggplot2::autoplot(stats::glm(glm.plot.obj)) + ggthemes::theme_gdocs()
```
<img src = "Images/glmplot.png"> <br>

<h2 align = "center">
Benchmarking
</h2>

- `microbenchmark::microbenchmark()` is used to obtain the time results in `testComplexity::asymptoticTimings()` for precision and convenience of having the benchmarks as a data frame. <br>
- `bench::bench_memory()` is used to compute the size of memory allocation in `testComplexity::asymptoticMemoryUsage()`. <br>

<h2 align = "center">
Testing
</h2>

- **Functions** <br>
The routines considered for testing the package's functionality along with a dedicated vignette-based article for each are listed below:  

| Source Package | Function | Article Link |
|----------------|----------|--------------|
| base           | gregexpr    | [Quadratic to linear transition for substring and gregexpr](https://anirban166.github.io/testComplexity/articles/substring_and_gregexpr.html) |
| base           | substring   | [Quadratic to linear transition for substring and gregexpr](https://anirban166.github.io/testComplexity/articles/substring_and_gregexpr.html) |
| fpop           | Fpop        | [fpop::Fpop(), a log-linear time segmentation algorithm](https://anirban166.github.io/testComplexity/articles/fpop.html) |
| gfpop          | gfpop       | [gfpop::gfpop(), a log-linear time algorithm for constrained changepoint detection](https://anirban166.github.io/testComplexity/articles/gfpop.html) |
| opart          | gaussian    | [opart::gaussian(), a quadratic time optimal partioning algorithm](https://anirban166.github.io/testComplexity/articles/opart.html) |
| PeakSegDP      | cDPA        | [PeakSegDP::cDPA, a quadratic time constrained dynamic programming algorithm](https://anirban166.github.io/testComplexity/articles/cDPA.html) |
| changepoint    | cpt.mean    | [PELT and SegNeigh algorithms for changepoint::cpt.mean()](https://anirban166.github.io/testComplexity/articles/PELT_and_SegNeigh.html) |
| PeakSegOptimal | PeakSegPDPA | [PeakSegOptimal::PeakSegPDPA, a log-linear time algorithm for constrained changepoint detection](https://anirban166.github.io/testComplexity/articles/PeakSegPDPA.html) |

- **Unit Testing** <br>
Test cases for testComplexity functions that utilize [testthat](https://cran.r-project.org/web/packages/testthat/index.html) can be found [here](https://github.com/Anirban166/testComplexity/blob/master/tests/testthat/test-testsfortestComplexity.R). <br>
- **Code Coverage** <br>
Tested using `covr::package_coverage()` both locally and via codecov, with [100% coverage](https://codecov.io/gh/Anirban166/testComplexity?branch=master) attained. <br>
- **OS Support** <br>
Windows is the native OS this package is developed and tested on. However, RCMD checks are run on latest versions of [MacOS](https://github.com/Anirban166/testComplexity/blob/cdb771a040e77ac02e715f033a7debf889a8efa2/.github/workflows/R-CMD-check.yaml#L21) and [Ubuntu](https://github.com/Anirban166/testComplexity/blob/cdb771a040e77ac02e715f033a7debf889a8efa2/.github/workflows/R-CMD-check.yaml#L22) as well. <br>
Note that the use of `bench::bench_memory()` overcomes the Windows-only OS limitation for memory complexity testing observed in `GuessCompx::CompEst()` as it successfully runs on other operating systems. <br>

<p align = "center">
<a href = "https://www.microsoft.com/en-in/windows"><img src = "https://img.shields.io/badge/Windows--brightgreen?style=for-the-badge&logo=Windows"></a> <a href = "https://www.linux.org/"><img src = "https://img.shields.io/badge/Linux--brightgreen?style=for-the-badge&logo=Linux"></a> <a href = "https://developer.apple.com/macos/"> <img src = "https://img.shields.io/badge/MacOS--brightgreen?style=for-the-badge&logo=Apple"> </a>
</p>