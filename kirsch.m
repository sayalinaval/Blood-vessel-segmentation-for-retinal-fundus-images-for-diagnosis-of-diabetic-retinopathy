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
%figure,imshow(G);
%title('green');
[counts,X]=imhist(G);
figure,imhist(G);
title('hist of green image');

h=fspecial('average',[5 5]);
G=imfilter(G,h);
figure,imshow(G);
title('smoothening');

cmap = contrast(G);
figure,imshow(G);
title('contrast enhancement');

G=im2double(G);
h1=fspecial('laplacian',0.2);
G1=imfilter(G,h1,'replicate');
G=G-G1;
figure,imshow(G);
title('sharpening');

w1=[5 -3 -3; 5 0 -3; 5 -3 -3];
w2=[-3 -3 5; -3 0 5; -3 -3 5];
w3=[-3 -3 -3; 5 0 -3; 5 5 -3];
w4=[-3 5 5; -3 0 5; -3 -3 -3];
w5=[-3 -3 -3; -3 0 -3; 5 5 5];
w6=[5 5 5; -3 0 -3; -3 -3 -3];
w7=[-3 -3 -3; -3 0 5; -3 5 5];
w8=[5 5 -3; 5 0 -3; -3 -3 -3];

a1=imfilter(G,w1);
b1=im2bw(a1);
figure,imshow(b1);

a2=imfilter(G,w2);
b2=im2bw(a2);
figure,imshow(b2);

a3=imfilter(G,w3);
b3=im2bw(a3);
figure,imshow(b3);

a4=imfilter(G,w4);
b4=im2bw(a4);
figure,imshow(b4);

a5=imfilter(G,w5);
b5=im2bw(a5);
figure,imshow(b5);

a6=imfilter(G,w6);
b6=im2bw(a6);
figure,imshow(b6);

a7=imfilter(G,w7);
b7=im2bw(a7);
figure,imshow(b7);

a8=imfilter(G,w8);
b8=im2bw(a8);
figure,imshow(b8);

b=b1+b2+b3+b4+b5+b6+b7+b8;
figure,imshow(b);