function [f,g] = myfunc(w,x,y)
lambda=.01;
n=size(x);
n=n(2);
    
f=lambda/2*w'*w;
g=lambda*w;
for i=1:n
f=f+log(1+exp(-y(i)*w'*x(:,i)));
g=g+1/(1+exp(-y(i)*w'*x(:,i)))*(-y(i)*x(:,i))*exp(-y(i)*w'*x(:,i));
end
endfunction
