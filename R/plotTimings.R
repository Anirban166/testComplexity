#' Function to plot timings vs data sizes from the data frame returned by asymptoticTimings
#'
#' @title Asymptotic Timings Plot function
#'
#' @param data.df A data frame composed of columns 'Timings' and 'Data sizes', which can be obtained by asymptoticTimings()
#'
#' @param titles A list of two elements consisting of strings for the plot title and subtitle.
#' # Optional, with default values set to empty strings. (no titles/subtitles)
#'
#' @param labels A list of two elements containing strings for x and y labels respectively.
#' # Optional, with default values set to appropriate labels.
#'
#' @param point.alpha A numeric value denoting transparency level (in the range 0 to 1) for point geometry.
#' # Optional, with the default value set to 1. (no transparentness)
#'
#' @param line.alpha A numeric value denoting transparency level (in the range 0 to 1) for line geometry.
#' # Optional, with the default value set to 1. (no transparentness)
#'
#' @param point.color A string specifying a known color or a representation in hexcode for point geometry.
#' # Optional, with the default color set as black. (Hex equivalent: #000000)
#'
#' @param line.color A string specifying a known color or a representation in hexcode for line geometry.
#' # Optional, with the default color set as black. (Hex equivalent: #000000)
#'
#' @param point.size A numeric value denoting the size of point geometry.
#' # Optional, with the default value set to (1.3).
#'
#' @param line.size A numeric value denoting the size of line geometry.
#' # Optional, with the default value set to (0.7).
#'
#' @return A ggplot object.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Plotters/
#'
#' @export
#' @import ggplot2

plotTimings = function(data.df, titles = list("", ""), labels = list("Data size", "Runtime (in nanoseconds)"), point.alpha = 1, line.alpha = 1, point.color = "black", line.color = "black", point.size = 1.3, line.size = 0.7)
{
 if(class(data.df) == "data.frame" & "Timings" %in% colnames(data.df) & "Data sizes" %in% colnames(data.df))
 {
   plot.obj <- ggplot(data.df, aes(x = `Data sizes`, y = Timings)) +
               geom_point(alpha = point.alpha, color = point.color, size = point.size) +
               geom_line(alpha = line.alpha, color = line.color, size = line.size) +
               labs(x = labels[[1]], y = labels[[2]]) +
               scale_x_log10() + scale_y_log10() +
               ggtitle(titles[[1]], subtitle = titles[[2]])

   return(plot.obj)
 }
 else stop("Input parameter must be a data frame with columns 'Timings' and 'Data sizes'")
}
