<p align = "center">
<img width = "740" height = "200" src = "Images/TransparentLogo.png">
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
    <a href="https://www.tidyverse.org/lifecycle/#experimental">
    <img src="https://img.shields.io/badge/lifecycle-experimental-orange.svg"
         alt="GitHub Lifecycle">
    <a href="https://www.r-project.org/">
    <img src="https://img.shields.io/github/languages/top/Anirban166/testComplexity?label=R"
         alt="GitHub Language">
    <a href="https://github.com/Anirban166/testComplexity/issues">
    <img src="https://img.shields.io/badge/Open%20Issues-3-orange"
         alt="GitHub Open Issues">
    <a href="https://github.com/Anirban166/testComplexity/issues?q=is%3Aissue+is%3Aclosed">
    <img src="https://img.shields.io/badge/Closed%20Issues-1-brightgreen"
         alt="GitHub Closed Issues">
         <a href="https://github.com/Anirban166/testComplexity/blob/master/LICENSE.md">
    <img src="https://img.shields.io/github/license/mashape/apistatus.svg"
         alt="GitHub License">
</p> 
<p align="center">
  <a href="#benchmarking">Benchmarking</a> •
  <a href="#testing">Testing</a> 
</p>    
             
---         
# Benchmarking
Among a few [options](https://anirban166.github.io//Benchmarking/), 
- `microbenchmark::microbenchmark()` is used to compute the benchmarks to obtain the time results in `testComplexity::asymptoticTimings()`, for the added convenience of having the benchmarked results as a data frame plus for the precision or time scale it produces the results on. (usually in nanoseconds, as can be found from [here](https://cran.r-project.org/web/packages/microbenchmark/microbenchmark.pdf))
- `bench::bench_memory()` would be used to compute the memory usage to obtain the memory use metrics in `testComplexity::asymptoticMemoryUsage()`.

---             
# Testing
A list of functions the package will be tested on can be found [here](https://github.com/Anirban166/testComplexity/issues/2#issue-615087634).
