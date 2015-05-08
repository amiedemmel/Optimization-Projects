%run.sce
%a=input('name for diary file: ');
%diary a;
%funcprot(0);

%part a,b
%run newton and gauss newton methods for dataset
newton

newton_gauss

%part c
%plot the model and scatterplot together to verify the accuarcy of model
t1=0:.1:10;
phi=x(1)*exp(x(2)*t1);

figure
hold on
plot(t1,phi)
plot(t,y,'+r')

xlabel('years');
ylabel('population of antelope');
legend('model','observed population');
%a=input('title for plot : ');
%title(a);
hold off

%part d
%analyze the performance of the methods by comparing the hessian and approximation used in gauss newton
disp('initial point')
disp(j0'*j0-h0)

disp('& of final point')
disp(jm'*jm-hm)
