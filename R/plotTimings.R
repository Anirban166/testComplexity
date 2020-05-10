plotTimings = function(data.frame = df)
{
 ggplot(df, aes(x=datasetsize, y=time)) + geom_point(aes(color = expr)) + geom_line(aes(color = expr)) + labs(x="N", y="Runtime") + scale_x_log10() + scale_y_log10()
}
