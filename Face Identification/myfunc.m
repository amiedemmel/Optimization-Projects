function [f,g] = myfunc(w,x,y)
global lambda n;
    
f=lambda/2*(w'*w);
g=lambda*w;
for i=1:n
f=f+log(1+exp(-y(i)*w'*x(:,i)));
g=g+1/(1+exp(-y(i)*w'*x(:,i)))*(-y(i)*x(:,i))*exp(-y(i)*w'*x(:,i));
end
