<p align = "center">
<img width = "740" height = "200" src = "Images/TransparentLogo.png" >
</p>

<p align="center">
    <a href="https://www.repostatus.org/#active">
    <img src="https://www.repostatus.org/badges/latest/active.svg"
         alt="GitHub Project Status">
    <a href="https://github.com/Anirban166/testComplexity">
    <img src="https://img.shields.io/badge/lifecycle-experimental-orange.svg"
         alt="GitHub Lifecycle">
    <a href="https://www.r-project.org/">
    <img src="https://img.shields.io/github/languages/top/Anirban166/testComplexity?label=R"
         alt="GitHub Language">
    <a href="https://github.com/Anirban166/testComplexity/issues">
    <img src="https://img.shields.io/github/issues-raw/Anirban166/testComplexity?color=important&label=Open%20Issues"
         alt="GitHub Open Issues">
    <a href="https://github.com/Anirban166/testComplexity/issues?q=is%3Aissue+is%3Aclosed">
    <img src="https://img.shields.io/github/issues-closed-raw/Anirban166/testComplexity?color=brightgreen&label=Closed%20Issues"
         alt="GitHub Closed Issues">
         <a href="https://anirban166.github.io/testComplexity/">
    <img src="https://img.shields.io/github/deployments/Anirban166/testComplexity/github-pages?label=Deployments%20%7C%20Github%20Pages"
         alt="GitHub Deployments">
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
Among a few [options](https://anirban166.github.io//Benchmarking/), `microbenchmark::microbenchmark()` is used to compute the benchmarks to obtain the time results in `testComplexity::asymptoticTimings()`, for the added convenience of having the benchmarked results as a data frame plus for the precision or time scale it produces the results on, ranging from nanoseconds to milliseconds at the least and `bench::bench_memory()` would be used to compute the memory usage to obtain the memory use metrics in `testComplexity::asymptoticMemoryUsage()`.

---             
# Testing
A list of functions the package will be tested on can be found [here](https://github.com/Anirban166/testComplexity/issues/2#issue-615087634).
