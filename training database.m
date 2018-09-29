clc;
clear all;
close all;
A=imread('D:\sayali\studies\BE-PROJECT\DRIVE\DRIVE\training\images\21_training.tif');
[m n]=size(A);
A=im2double(A);

G=padarray(A,[1 1]);
[x y]=size(G);
 for i=2:x-1
     for j=2:y-1
         w=[G(i-1,j+1) G(i,j+1) G(i+1,j+1); G(i-1,j) G(i,j) G(i+1,j); G(i-1,j-1) G(i,j-1) G(i+1,j-1)];   
         f1(i,j)=G(i,j)- min(min(w));
         f2(i,j)=max(max(w))-G(i,j);
         f3(i,j)=G(i,j)-mean(mean(w));
         f4(i,j)= std(std(w));
         f5(i,j)=G(i,j);
     end
 end