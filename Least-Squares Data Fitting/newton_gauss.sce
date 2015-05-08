//Guass-Newton Method

exec myfuncng.sci;
disp('Gauss-Newton Method')
maxiter=100;
tol=10^-6;
iter=0;

x=input('enter x vector: ');
t=input('time vector: ');
y=input('y vector: ');

[f,g,r,J]=myfuncng(x,t,y)
j0=J;

titl=['  iter' '    f(x)' '    df(x)/dx1' '  df(x)/dx2' 'norm(df(x)'];
disp(titl);
while((norm(g) > tol)&(iter < maxiter))
    iter=iter+1;
    JJ=J'*J;
    Jr=-1*J'*r;
    p=JJ\Jr;
    x=x+p;
    [f,g,r,J]=myfuncng(x,t,y);
    n=[iter f g' norm(g)];
    disp(n);
end
jm=J;

disp('Solution: ')
disp(x)
