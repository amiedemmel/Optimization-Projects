
%This function evaluates the gradient of the Rosenbrock function

function y = grad(x)
y=zeros(2,1);
y(1) = 100*(2*(x(1)^2-x(2))*2*x(1)) + 2*(x(1)-1);
y(2) = 100*2*(x(2)-x(1)^2);
end