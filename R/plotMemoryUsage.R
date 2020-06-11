#' Function to plot timings vs data sizes from the data frame returned by asymptoticMemoryUsage()
#'
#' @title Asymptotic Memory Usage Plot function
#'
#' @param data.df A data frame composed of columns 'Memory Usage' and 'Data sizes', which can be obtained by asymptoticMemoryUsage()
#'
#' @return A ggplot object.
#'
#' @export
#' @import ggplot2

plotMemoryUsage = function(data.df)
{
  if(class(data.df) == "data.frame" & "Memory usage" %in% colnames(data.df) & "Data sizes" %in% colnames(data.df))
  {
    ggplot(data.df, aes(x = `Data set sizes`, y = Timings)) + geom_point() + geom_line() + labs(x = "Data sizes", y = "Memory size") + scale_x_log10() + scale_y_log10()
  }
  else stop("Input parameter must be a data frame with columns 'Memory usage' and 'Data sizes'")
}
