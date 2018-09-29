clc;
clear all;
close all;
load w1.mat;
ip=load('test1.txt');
t=load('t1.txt');
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