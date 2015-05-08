%Guass-Newton Method
%Amie Demmel
%4/1/15

%model to be fitted info in myfuncng.sci
%solves least squares problem by minimizing the sum of the residues squared
%explictly defined in myfuncng.sci

disp('Gauss-Newton Method')

%initialize
maxiter=100;
tol=10^-6;
iter=0;

%input initial guess x, and inital data (t,y)
x=input('enter x vector: ');
t=input('time vector: ');
y=input('y vector: ');

%f is optimal function, g is the gradient of f, r is vector of residues, J is approx hessian
[f,g,r,J]=myfuncng(x,t,y);

%store the hessian approx.
j0=J'*J;

titl=['  iter' '    f(x)' '    df(x)/dx1' '  df(x)/dx2' 'norm(df(x)'];
disp(titl);

%loop until the norm of gradient less than tol
%no line search p is def by guass-newton:  J'*J*p=-J'*r
while((norm(g) > tol)&&(iter < maxiter))
    iter=iter+1;
    JJ=J'*J;
    Jr=-1*J'*r;
    p=JJ\Jr;
    x=x+p;
    [f,g,r,J]=myfuncng(x,t,y);
    n=[iter f g' norm(g)];
    disp(n);
end

%store the final hessian approx
jm=J'*J;

%optimal parameters
disp('Solution: ')
disp(x)

