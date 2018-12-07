#' Creates a non linear squared model of type: y = a * exp(b * x)
#'
#' Takes in x and y vectors and returns the coefficients a and b of the model created
#' @param x a numeric vector
#' @param y a numeric vector that should not contain 0 values
#' @examples  x = c(1:14) ; y = c(1880,813,376,161,100,61,31,9,8,2,7,4,3,2)
#' @return the predicted values of a and b
#' @export

anls = function(x,y){
  data = data.frame(x,y)
  fm0 <- nls(log(y) ~ log(a * exp(b * x)), data, start = c(a = 1, b = 1))
  anls = nls(y ~ a * exp(b * x), data, start = coef(fm0))
  return(anls)
}

#' Calculates the predicted y values (y_hat) by the model
#'
#' Takes in x and y vectors and returns the predicted y values (y_hat) by the model
#' @param x a numeric vector
#' @param y a numeric vector that should not contain 0 values
#' @examples  x = c(1:14) ; y = c(1880,813,376,161,100,61,31,9,8,2,7,4,3,2)
#' @return predicted y values (y_hat) by the model
#' @export

y_hat = function(x,y){
  data = data.frame(x,y)
  fm0 <- nls(log(y) ~ log(a * exp(b * x)), data, start = c(a = 1, b = 1))
  nls = nls(y ~ a * exp(b * x), data, start = coef(fm0))
  a_hat = coef(nls)[1]
  b_hat = coef(nls)[2]
  y_hat = a_hat * exp(b_hat * x)
  return(y_hat)
}

#' Plots the curve of the model
#'
#' Takes in x and y vectors and returns the predicted y values (y_hat) by the model
#' @param x a numeric vector
#' @param y a numeric vector that should not contain 0 values
#' @examples  x = c(1:14) ; y = c(1880,813,376,161,100,61,31,9,8,2,7,4,3,2)
#' @return Plots the curve of the model
#' @export

plotc = function(x,y){
  data = data.frame(x,y)
  fm0 <- nls(log(y) ~ log(a * exp(b * x)), data, start = c(a = 1, b = 1))
  nls = nls(y ~ a * exp(b * x), data, start = coef(fm0))
  a_hat = coef(nls)[1]
  b_hat = coef(nls)[2]
  y_hat = a_hat * exp(b_hat * x)
  library(ggplot2)
  ggplot(aes(x = x, y = y_hat),data = data.frame(x,y_hat)) +
  geom_line() + ylab("a*exp(b*x)") + ggtitle("Curve of the model")
}

