//Homework Problem function evaluations
function [f,g,h] = myfuncn(x,t,y)
    phi=x(1)*exp(x(2)*t)
    r=phi-y
    f=1/2*sum(phi.^2)
    g(1)=sum(exp(x(2)*t).*r)
    g(2)=sum(t.*phi.*r)
    h(1,1)=sum(exp(2*x(2)*t))
    h(1,2)=sum(2*x(1)*t.*exp(2*x(2)*t)-y.*t.*exp(x(2)*t))
    h(2,1)=h(1,2)
    h(2,2)=sum(2*(t.*phi).^2-y.*t.^(2).*phi)
endfunction
