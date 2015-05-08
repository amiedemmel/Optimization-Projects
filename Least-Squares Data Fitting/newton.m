%Newton's Method
%Amie Demmel
%4/1/15

%model to be fitted contained in myfuncn.sci
%solves a least squares problem by minimizing the sum of the residues squared
%explictly defined in myfuncn.sci

disp('Newton Method: ')

%initialize
maxiter=100;
tol=10^-6;

iter=0;



%input initial guess (x) and data
x=input('enter x vector: ');
t=input('time vector: ');
y=input('y vector: ');

%f is the optimal function, g is the gradient of f, h is the hessian of f
[f,g,h]=myfuncn(x,t,y);

%store the inital hessian
h0=h;

titl=['  iter' '    f(x)' '    df(x)/dx1' '  df(x)/dx2' 'norm(df(x)'];
disp(titl);

%loop until the norm of the gradient is less than tol, or timed-out
%no line search p is defined by newton's method: h*p=-g
while((norm(g) > tol)&&(iter < maxiter))   
	iter=iter+1;
	p=-h\g;
    x=x+p;
    
    [f,g,h]=myfuncn(x,t,y);
    n=[iter f g' norm(g)];
    disp(n);
end


%store the final hessian
hm=h;

%optimal parameters
disp('Solution: ')
disp(x)