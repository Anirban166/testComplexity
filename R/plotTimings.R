#' Function to plot timings vs data sizes from the data frame returned by asymptoticTimings
#'
#' @title Asymptotic Timings Plot function
#'
#' @param data.df A data frame composed of columns 'Timings' and 'Data sizes', which can be obtained by asymptoticTimings()
#'
#' @param titles A list of two elements, consisting of the plot title and subtitle.
#' # Optional, with default values set to empty strings. (no titles/subtitles)
#'
#' @param alpha.value A value denoting transparency level (in the range 0 to 1) for point and line geometry.
#' # Optional, with the default value set to 1. (no transparentness)
#'
#' @return A ggplot object.
#'
#' @export
#' @import ggplot2

plotTimings = function(data.df, titles = list("",""), alpha.value)
{
 if(class(data.df) == "data.frame" & "Timings" %in% colnames(data.df) & "Data sizes" %in% colnames(data.df))
 {
   alpha.value = ifelse(missing(alpha.value), 1, alpha.value)

   plot.obj <- ggplot(data.df, aes(x = `Data sizes`, y = Timings)) +
               geom_point(alpha = alpha.value) +
               geom_line(alpha = alpha.value) +
               labs(x = "Data sizes", y = "Runtime (in nanoseconds)") +
               scale_x_log10() + scale_y_log10() +
               ggtitle(titles[[1]], subtitle = titles[[2]])

   return(plot.obj)
 }
 else stop("Input parameter must be a data frame with columns 'Timings' and 'Data sizes'")
}
