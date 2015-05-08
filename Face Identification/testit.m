function [t] = testit(w,x)
t=1/(1+exp(-1*w'*x));