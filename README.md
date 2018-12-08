# AdvandeNonLinearSquared

This package builds models of type: a * exp(b * x). It is based on "nls", however using this package you don't need to specify the start points (a and b), they are actually predicted.

It contains 3 functions:

- anls: It takes in x and y vectors (y must not contain null values) and returns an nls object containing the estimated coefficients a and b of the model created. The resulted nls object also has other attributes that can be accessed.
- y_hat: It return the predicted y values calculated using the estimated parameters a_hat and b_hat.
- plotc: It plots the curve of the predicted model using ggplot.

Data example to run: x = c(1:14) ; y = c(1880,813,376,161,100,61,31,9,8,2,7,4,3,2).
