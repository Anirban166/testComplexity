plotTimings = function(data.frame = df)
{

 ggplot(df, aes(x = `Data set sizes`, y = Timings)) + geom_point() + geom_line() + labs(x = "N", y = "Runtime") + scale_x_log10() + scale_y_log10()

}
