T=3:-.1:0;
n=size(T);

lamb1=-(3*T-1)+sqrt((3*T-1).^2-4*1*(-T));
lamb1=lamb1/2;

lamb2=-(3*T-1)-sqrt((3*T-1).^2-4*1*(-T));
lamb2=lamb2/3;

s1a=1-lamb1;
s1b=1-lamb2;

if -lamb1>=0 then
    x1=T./s1a;
    x2=x1;
else
    x1=T./s1b;
    x2=x1;
end

//boundry of fesible region
x=-.1:.1:1.1;
m=size(x);
y=1-x;
bond=zeros(1,m(2))
plot(x,y,'k',x,bond,'k',bond,x,'k')

//plot the path of x1,x2 as T approaches 0
plot(x1,x2,'o',x1(n(2)),x2(n(2)),'ro')
//legend('T>0','T=0');

xlabel('x1');
ylabel('x2');
title('Plot of fesible region and central path on x1-x2 plane');
//legend('x1+x2+x3=1','x2>0','x1>0','T>0','T=0');

