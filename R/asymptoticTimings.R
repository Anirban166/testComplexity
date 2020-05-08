asymptoticTimings = function(expression = expr(N, RN = NULL))
{
    exprname <- as.character(substitute(expr))
    if(!is.null(RN)) # Use vector RN if specified
    {
      l <- length(RN)
      for(i in 1:l)
      {
        timings <- as.data.frame(microbenchmark(exprname = expr[i]))
        if(i == 1)
        {
          timings$datasetsize <- datasetsizes[i] # adding column 'datasetsize' and append the first datasetsize (10) to observations 1-100.
          result <- timings # creating a data frame with our columns expr, timings and our newly appended datasetsize.
        }
        else
        { # appending the subsequent datasetsizes with the corresponding timings after first iteration. combining them using rbind():
          timings$datasetsize <- datasetsizes[i]
          result <- rbind(result, timings)
        }
      }
      return(data.table(result))
    }
    else # if optional parameter RN isn't specified
    {
      datasetsizes <- c(10^seq(1,N,by=0.5))
      # total obs. = (N + (N-1))x100. For eg: N=2 -> 300 obs., N=3 -> 500 obs., N=4 -> 700 obs. and so on.
      l <- length(datasetsizes)
      for(i in 1:l)
      {
        timings <- as.data.frame(microbenchmark(exprname = expr[i]))
        if(i == 1)
        {
          timings$datasetsize <- datasetsizes[i]
          result <- timings
        }
        else
        {
          timings$datasetsize <- datasetsizes[i]
          result <- rbind(result, timings)
        }
      }
      return(data.table(result))
    }
}
