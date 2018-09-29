clc;
clear all;
close all;
load wt.mat;
ip=load('testing.txt');
t=load('target.txt');
t=t';
ip=ip';
y=round(sim(net,ip));
[m n]=size(t);
X=1:1:n;
plot(y,t);
xlabel('observed output');
ylabel('predicted output');
figure();
plot(X,y,'b-',X,t,'r-')
legend('Predicted','observed');