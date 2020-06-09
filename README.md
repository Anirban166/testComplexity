<p align = "center">
<img width = "740" height = "200" src = "Images/TransparentLogo.png">
</p>

<p align="center">
    <a href="https://rstudio.com/">
    <img src="https://img.shields.io/badge/RStudio-IDE-black?style=for-the-badge&logo=RStudio"
         alt="RStudio IDE">    
    <a href="https://git-scm.com/">
    <img src="https://img.shields.io/badge/Git-VCS-orange?style=for-the-badge&logo=git"
         alt="Git Version Control System">
    <a href="https://www.r-project.org/">
    <img src="https://img.shields.io/badge/Project-Org-blue?style=for-the-badge&logo=R"
         alt="The R project for statistical computing">
    <a href="https://summerofcode.withgoogle.com/projects/#4887653356404736">
    <img src="https://img.shields.io/badge/Google%20Summer%20of%20code-Funded-success?style=for-the-badge&logo=Google"
         alt="GSoC project (Google funded)">
    <a href="https://github.com/Anirban166/testComplexity/blob/master/LICENSE.md">
    <img src="https://img.shields.io/badge/License-MIT-black?style=for-the-badge"
         alt="GitHub License">       
</p> 

<p align="center">
    <a href="https://www.repostatus.org/#active">
    <img src="https://www.repostatus.org/badges/latest/active.svg"
         alt="GitHub Project Status">
    <a href="https://travis-ci.com/github/Anirban166/testComplexity">
    <img src="https://travis-ci.com/Anirban166/testComplexity.svg?branch=master"
         alt="Build status (Travis CI)">      
    <a href="https://codecov.io/gh/Anirban166/testComplexity?branch=master">    
    <img src="https://codecov.io/gh/Anirban166/testComplexity/branch/master/graph/badge.svg"
         alt="Code Coverage (covr/codecov)">
    <a href="https://www.codacy.com/manual/bloodraven166/testComplexity?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Anirban166/testComplexity&amp;utm_campaign=Badge_Grade">
    <img src="https://app.codacy.com/project/badge/Grade/d69a466f4597434e9118ee59ae3307e3"    
         alt="Codacy Badge">
    <a href="https://www.tidyverse.org/lifecycle/#experimental">
    <img src="https://img.shields.io/badge/lifecycle-experimental-orange.svg"
         alt="GitHub Lifecycle">
    <a href="https://www.r-project.org/">
    <img src="https://img.shields.io/github/languages/top/Anirban166/testComplexity?label=R"
         alt="GitHub Language">
    <a href="https://github.com/Anirban166/testComplexity/issues">
    <img src="https://img.shields.io/badge/Open%20Issues-4-orange"
         alt="GitHub Open Issues">
    <a href="https://github.com/Anirban166/testComplexity/issues?q=is%3Aissue+is%3Aclosed">
    <img src="https://img.shields.io/badge/Closed%20Issues-1-brightgreen"
         alt="GitHub Closed Issues">
</p> 
<p align="center">
  <a href="#abstract">Abstract</a> •
  <a href="#functional-flow">Functional Flow</a> •
  <a href="#benchmarking">Benchmarking</a> • 
  <a href="#testing">Testing</a>     
</p>    
        
---
## Abstract
R package developers currently use ad-hoc tests of asymptotic computational complexity via empirical timings of functions and visual diagnostic plots. However, there is no framework in R for systematically testing the empirical computational complexity of functions. This is a problem because such a testing framework could be essential for identifying big speed gains in R code as well. This project will provide a new package by the name of 'testComplexity' that will be useful for testing and improving the speed of various R functions and algorithms. It will help to classify an algorithm’s time complexity trends, quantify its run timings, plot the timings which help to visually conceive the complexity results, differentiate between algorithms via comparison plots as to which is better in performance and identify potential speed gains. Additionally, memory complexity testing will also be covered.

## Functional Flow
```r
___________________________ R Files _____________________________
testComplexity                              @ returns
├──> asymptoticTimings                    : data.frame
│    ├──> asymptoticTimeComplexityClass   :   ├──> string
|    └──> plotTimings                     :   └──> ggplot object
├──> asymptoticMemoryUsage                : data.frame
│    ├──> asymptoticMemoryComplexityClass :   ├──> string
│    └──> plotMemoryUsage                 :   └──> ggplot object
└──> testthat
     └──> testsfortestComplexity
_________________________________________________________________
```

## Benchmarking
Among a few [options](https://anirban166.github.io//Benchmarking/), 
- `microbenchmark::microbenchmark()` is used to compute the benchmarks to obtain the time results in `testComplexity::asymptoticTimings()`, for the added convenience of having the benchmarked results as a data frame plus for the precision or time scale it produces the results on. (usually in nanoseconds, as can be found from [here](https://cran.r-project.org/web/packages/microbenchmark/microbenchmark.pdf)) <br>
- `bench::bench_memory()` would be used to compute the memory usage to obtain the memory use metrics in `testComplexity::asymptoticMemoryUsage()`. <br>
            
## Testing
- **Functions:** A list of functions the package will be tested on can be found [here](https://github.com/Anirban166/testComplexity/issues/2#issue-615087634). <br>
- **Unit Testing**: Test cases for testComplexity functions via [testthat](https://cran.r-project.org/web/packages/testthat/index.html) package can be found [here](https://github.com/Anirban166/testComplexity/blob/master/tests/testthat/test-testsfortestComplexity.R). <br>
- **Code Coverage**: Tested locally by `covr::package_coverage()` and codecov, with 100% code coverage. <br>
- **OS Support**: Travis-CI builds are tested on Linux machines, whereas Windows is the native OS this package is developed and tested on. <br>
<a href="https://www.microsoft.com/en-in/windows"> <img src="https://img.shields.io/badge/Windows--brightgreen?style=for-the-badge&logo=Windows"> <a href="https://www.linux.org/"> <img src="https://img.shields.io/badge/Linux--brightgreen?style=for-the-badge&logo=Linux">
    
## Task List
- [x] Time complexity testing.
- [ ] Memory complexity testing.
- [ ] Classification of user given output (output size is the metric, instead of timings/memory-usage) parameter.
- [ ] Add testing functions, with optional packages in suggests.
- [ ] Make PRs to master, with code-reviewed commits.

---
<h2 align="center">
Author::Links()    
</h2>

<p align="center">
    <a href="mailto:bloodraven166@gmail.com"> 
    <img height="60" src="https://img.shields.io/badge/--white?style=flat&logo=gmail"
         alt="Primary Email">      
    <a href="https://stackoverflow.com/users/11422223/anirban166?tab=profile">    
    <img height="60" src="https://img.shields.io/badge/--white?style=flat&logo=Stack%20Overflow"
         alt="Stack Overflow Link">
    <a href="https://www.hackerrank.com/Bloodraven166">
    <img height="60" src="https://img.shields.io/badge/--white?style=flat&logo=HackerRank"
         alt="HackerRank Link">
    <a href="https://www.instagram.com/anirban.166/">
    <img height="60" src="https://img.shields.io/badge/--white?style=flat&logo=Instagram"
         alt="Instagram Link">    
    <a href="mailto:Anirban.code@studentpartner.com">
    <img height="60" src="https://img.shields.io/badge/--black?style=flat&logo=Microsoft"
         alt="Microsoft Student Partner Email">            
    <a href="https://github.com/Anirban166">
    <img height="60" src="https://img.shields.io/badge/--black?style=flat&logo=Github"
         alt="GitHub Link">  
    <a href="https://anirban166.github.io/posts/">
    <img height="60" src="https://img.shields.io/badge/--black?style=flat&logo=Google%20messages"
         alt="Website Link">
    <a href="https://www.linkedin.com/in/anirban166/">
    <img height="60" src="https://img.shields.io/badge/--black?style=flat&logo=LinkedIn"
         alt="LinkedIn Link">
</p> 
