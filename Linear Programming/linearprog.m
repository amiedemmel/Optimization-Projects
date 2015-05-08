%Code to set up problem and then use linprog to optimize x

%A,y, and true_x are in this file
load('dataHW9.mat')

%Basic matrices of ones and zeros need to construct Aeq and Ain
Z1=zeros(25,100);
z=zeros(100,1);
i=ones(100,1);

%Our matrices for problem
f=[z;i];
Aeq=[A Z1];
Ain=[eye(100) eye(100);-1*eye(100) eye(100)];
b=[z;z];

%Optimize
[x,fval]=linprog(f,-1*Ain,b,Aeq,y);

%Estimate how well the optimized x(the first 100 are x, the second 100 are t)
%approximates x_true
disp('Difference Norm of optx and x_true')
disp(norm(x(1:100)-x_true))

%Find the non-zero entries in x_true and compare to the same enteries with x to
%see if the opt approxs x_true
iter=1;
for j=1:100
    if x_true(j)~=0
        ind(iter)=j;
        iter=iter+1;
    end
end

%Display the non-zero entries of x and x_true
disp('Non-0 index   x(index)   X_true(index)')
disp([ind' x(ind) x_true(ind)])

%Display the full solution
disp('Full x vector calculated: ')
disp([x(1:100)])