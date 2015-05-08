exec func.sci;
exec grad.sci;
exec hess.sci;

MM=500;
// parameters for backtracking line search
c=0.1;
rho=0.7;
alpha=1;

// matrices to store xk's, fk's and alpha_k's. max iteration=500.
xx=zeros(2,MM);
ff=zeros(1,MM);
aa=zeros(1,MM);

// initialization
x=[1.2; 1.2];

[f]=func(x);
f0=f+1;
[B]=hess(x);
//p=-inv(B)*grad(x);
iter=1;
xx(:,1)=x;

while abs(f-f0)>1e-10 & iter<MM //stopping rule
    iter=iter+1;
    
alpha=1;

//check that B is pos def
while det(B)<0
    B = B + 2*eye(2);
end
p=-inv(B)*grad(x);

x1=x+alpha*p;

f1=func(x1);


// backtracking line search
while f1>f+c*alpha*(-p'*p)
 
   alpha=rho*alpha;
   x1=x+alpha*p;
   f1=func(x1);
    
end

aa(iter)=alpha;
f0=f;
x=x+alpha*p;
f=func(x);
B=hess(x);
p=-inv(B)*grad(x);
xx(:,iter)=x;
ff(iter)=f;

end

// remove the  zero entries at the end of the sorage matrices. 
xx=xx(:,1:iter);
ff=ff(1:iter);
aa=aa(1:iter);

//plot the contour of the function and the trajectary of xk
x1a=-1.5:0.01:1.5;
x2a=0.5:0.01:1.5;
//[x1a,x2a]=meshgrid(-1.5:0.01:1.5,0.5:0.01:1.5);
function z=ya(x1a,x2a),z=100.*(x2a-x1a.^2).^2+(1-x1a).^2,endfunction
figure,
contour(x1a,x2a,ya,10)
//hold on
plot(xx(1,:),xx(2,:),'r-')
//hold off

