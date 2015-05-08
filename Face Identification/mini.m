global lambda n;
%load('data.mat');
a=facedata(1:400,:);
b=nonfacedata(1:600,:);
x=[a; b]';
y=[ones(1,400) -1*ones(1,600)]';

lambda=.005;
n=size(x);
n=n(2);

w0=zeros(361,1);

options=optimoptions('fminunc','GradObj','on','MaxIter',1000,'Display','iter');
%options=optimset('LargeScale','off','HessUpdate','bfgs','gradobj','on','MaxIter',1000,'display','iter');

func=@(w)myfunc(w,x,y);
w1=fminunc(func,w0,options);
%w2=fminunc(func,w0,options);