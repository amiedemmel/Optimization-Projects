//Homework Problem function evaluations
function [f,g,r,J] = myfuncng(x,t,y)
    phi=x(1)*exp(x(2)*t)
    r=phi-y
    f=1/2*sum(phi.^2)
    g(1)=sum(exp(x(2)*t).*r)
    g(2)=sum(t.*phi.*r)
    J(:,1)=exp(x(2)*t)
    J(:,2)=x(1)*t.*exp(x(2)*t)
endfunction
