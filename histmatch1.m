clc;
clear all;
close all;
A=imread('C:\Users\DELL\Downloads\download (1).jpg');
[m n]=size(A);
figure,imshow(A);
title('original');
aa=rgb2gray(A);
[counts,X]=imhist(aa);
figure,imhist(aa);
title('hist of original image');
whos A;

aa=histeq(A);
figure,imshow(aa);
figure,imhist(aa);
title('hist equ using direct funcn');
B=cumsum(counts);
for i=0:255
    C(i+1)= round((B(i+1)/(m*n))*255);
end
D=reshape(A,1,m*n);
for j=1:m*n
    p=D(j);
    q=C(p+1);
    E(j)=q;
end
    F=reshape(E,m,n);
    figure,imshow(uint8(F));
title('enhanced image');
figure,imhist(uint8(F));
title('hist wdout direct function');
