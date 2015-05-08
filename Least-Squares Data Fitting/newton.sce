//Newton's Method
//Amie Demmel
//4/1/15

//model to be fitted contained in myfuncn.sci
exec myfuncn.sci;
disp('Newton Method: ')
maxiter=100;
tol=10^-6;
iter=0;

x=input('enter x vector: ');
t=input('time vector: ');
y=input('y vector: ');

[f,g,h]=myfuncn(x,t,y)
h0=h;

titl=['  iter' '    f(x)' '    df(x)/dx1' '  df(x)/dx2' 'norm(df(x)'];
disp(titl);
while((norm(g) > tol)&(iter < maxiter))
    iter=iter+1;
    p=-h\g;
    x=x+p;
    [f,g,h]=myfuncn(x,t,y);
    n=[iter f g' norm(g)];
    disp(n);
end
hm=h;

disp('Solution: ')
disp(x)
