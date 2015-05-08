//Hessian of 
function [y]=hess(x)
y=zeros(2,2);
y(1,1)=-400*(x(2)-x(1)^2)-400*x(1)*(-2*x(1))+2;
y(1,2)=-40*x(1);
y(2,1)=y(1,2);
y(2,2)=20;
endfunction
