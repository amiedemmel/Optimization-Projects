Aeq=[
1 -1 0
1  1 1
];
beq=[0;2];
c=[-1;-1;0];
x0=[0.1;0.1;1.8];
[xopt,fopt,exitflag,iter,yopt]=karmarkar(Aeq,beq,c)
xstar=[1 1 0]'
