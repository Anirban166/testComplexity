#' Function to plot timings vs data sizes from the data frame returned by asymptoticMemoryUsage()
#'
#' @title Asymptotic Memory Usage Plot function
#'
#' @param data.df A data frame composed of columns 'Memory Usage' and 'Data sizes', which can be obtained by asymptoticMemoryUsage()
#'
#' @param titles A list of two elements consisting of strings for the plot title and subtitle.
#' Optional, with default values set to empty strings. (no titles/subtitles)
#'
#' @param labels A list of two elements containing strings for x and y labels respectively.
#' Optional, with default values set to appropriate labels.
#'
#' @param point.alpha A numeric value denoting transparency level (in the range 0 to 1) for point geometry.
#' Optional, with the default value set to 1. (no transparentness)
#'
#' @param line.alpha A numeric value denoting transparency level (in the range 0 to 1) for line geometry.
#' Optional, with the default value set to 1. (no transparentness)
#'
#' @param point.color A string specifying a known color or a representation in hexcode for point geometry.
#' Optional, with the default color set as black. (Hex equivalent: #000000)
#'
#' @param line.color A string specifying a known color or a representation in hexcode for line geometry.
#' Optional, with the default color set as black. (Hex equivalent: #000000)
#'
#' @param point.size A numeric value denoting the size of point geometry.
#' Optional, with the default value set to (1.3).
#'
#' @param line.size A numeric value denoting the size of line geometry.
#' Optional, with the default value set to (0.7).
#'
#' @return A ggplot object.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Plotters/
#'
#' @export
#' @import ggplot2
#'
#' @examples
#' # Quantifying the memory usage for the allocation of a square matrix (N*N dimensions)
#' # against a set of input data sizes:
#' input.sizes = 10^seq(1, 3, by = 0.1)
#' memory.usage.data <- asymptoticMemoryUsage(matrix(data = N:N, nrow = N, ncol = N), input.sizes)
#' # Plotting the trend between computed memory allocations and data sizes:
#' plotMemoryUsage(memory.usage.data)

plotMemoryUsage = function(data.df, titles = list("", ""), labels = list("Data sizes", "Memory usage (in bytes)"), point.alpha = 1, line.alpha = 1, point.color = "black", line.color = "black", point.size = 1.3, line.size = 0.7)
{
  if(class(data.df) == "data.frame" & "Memory usage" %in% colnames(data.df) & "Data sizes" %in% colnames(data.df))
  {
    plot.obj <- ggplot(data.df, aes(x = `Data sizes`, y = `Memory usage`)) +
                geom_point(alpha = point.alpha, color = point.color, size = point.size) +
                geom_line(alpha = line.alpha, color = line.color, size = line.size) +
                labs(x = labels[[1]], y = labels[[2]]) +
                scale_x_log10() + scale_y_log10() +
                ggtitle(titles[[1]], subtitle = titles[[2]])

    return(plot.obj)
  }
  else stop("Input parameter must be a data frame with columns 'Memory usage' and 'Data sizes'")
}
