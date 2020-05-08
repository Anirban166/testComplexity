#' Preliminary function to distinguish between log-linear vs quadratic time complexity of two
#' algorithms/functions having parameters:
#'
#' count.vec,                            <- integer vector of count data.
#' weight.vec=rep(1, length(count.vec)), <- numeric vector of positive weights.
#' and max.segments.                     <- integer of length 1: maximum number of segments. (>= 2)
#'
#' @title Log-linear vs Quadratic time complexity classifier
#'
#' @param f1 Function based on an algorithm which is known or expected to run at either log-linear or
#'           quadratic time complexity, different from that of f2.
#'
#' @param f2 Function based on an algorithm which is known or expected to run at either log-linear or
#'           quadratic time complexity, different from that of f1.
#'
#' @return This function does not return any value but a statement indicating which among the two is
#'         log-linear and which is quadratic in nature. (it can be made to return that as a string)
#'
#' @export
#' @import microbenchmark
#' @importFrom stats rpois

loglinearvsquadraticClassifier<-function(f1,f2)
{
  f1name<-as.character(substitute(f1))
  f2name<-as.character(substitute(f2))

  if(f1name!=f2name)
  {
    cat("Among the two functions passed as parameters, (calculating..please wait)\n")

    s <- summary(microbenchmark( f1(rpois(1000,10),rep(1,length(rpois(1000,10))),3L),
                                 f2(rpois(1000,10),rep(1,length(rpois(1000,10))),3L)))

    if(s$mean[1]>s$mean[2])
      cat(f1name," follows quadratic time complexity whereas ",
          f2name," two follows log-linear time complexity.")
    else if(s$mean[1]<s$mean[2])
      cat(f2name," follows quadratic time complexity whereas ",
          f1name," follows log-linear time complexity.")
  }
  else print("both the functions cannot be same!")
}

