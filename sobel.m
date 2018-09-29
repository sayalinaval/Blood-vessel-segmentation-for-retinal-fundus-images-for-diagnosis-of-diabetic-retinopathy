clc;
clear all;
close all;
A=imread('C:\Documents and Settings\hp.PC209931236527.002\Desktop\BE-PROJECT\DRIVE\DRIVE\test\images\01_test.tif');
[m n]=size(A);
figure,imshow(A);
title('original');
aa=rgb2gray(A);
[counts,X]=imhist(aa);
%figure,imhist(aa);
%title('hist of original image');
whos A;

%Green Component
G = A(:,:,2);
figure;
image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;

[m n]=size(G);
figure,imshow(G);
title('green');
[counts,X]=imhist(G);
figure,imhist(G);
title('hist of green image');

BW = edge(G,'sobel');
figure,imshow(BW);