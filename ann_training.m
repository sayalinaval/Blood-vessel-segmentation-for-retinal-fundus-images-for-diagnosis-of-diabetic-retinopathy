clc;
close all;
clear all;
A=load('training.txt');
%A=A./100;
p=A(1:1:103,1:1:7)';
t=A(1:1:103,8)';
[a b]=size(t);
net = feedforwardnet(15);
net.divideFcn='divideblock';
%[trainInd,valInd,testInd] = divideblock(103,0.5,0.1,0.4);
net = configure(net,p,t);
net = init(net);
[net,tr] = train(net,p,t);
plotperf(tr)
Outputs = net(p);
trOut = round(Outputs(tr.trainInd));
vOut = round(Outputs(tr.valInd));
tsOut = Outputs(tr.testInd);
trTarg =t(tr.trainInd);
vTarg = t(tr.valInd);
tsTarg =t(tr.testInd);
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',tsTarg,tsOut,'Testing')
figure
[m n]=size(tsTarg);
X=1:1:n;
plot(X,tsOut,'r-',X,tsTarg,'k-')
legend('Predicted','observed');