#' Function to plot the timings from the data frame returned by asymptoticTimings
#'
#' @title Asymptotic Timings plot function
#'
#' @param data.df A data frame composed of columns 'Timings' and 'Data sizes', which can be obtained by asymptoticTimings()
#'
#' @return A ggplot object.
#'
#' @export
#' @import ggplot2

plotTimings = function(data.df)
{

 ggplot(data.df, aes(x = `Data set sizes`, y = Timings)) + geom_point() + geom_line() + labs(x = "N", y = "Runtime") + scale_x_log10() + scale_y_log10()

}
