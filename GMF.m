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


%h = fspecial('gaussian', [3 3], 0.5) 
h=fspecial('average',[5 5]);
G=imfilter(G,h);
figure,imshow(G);
title('smoothening');


G=im2double(G);
h1=fspecial('laplacian',0.2);
G1=imfilter(G,h1,'replicate');
G=G-G1;
figure,imshow(G);
title('sharpening');

cmap = contrast(G);
figure,imshow(G);
title('contrast enhancement');


M=imopen(G,strel('disk',20));
G=G-M;
figure,imshow(G);
title('opening');




%G=histeq(G,256);
%figure,imhist(G);

w1=[4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4;4 0 -3 -5 -3 0 4]
w2=imrotate(w1,15,'crop');
w3=imrotate(w1,30,'crop');
w4=imrotate(w1,45,'crop');
w5=imrotate(w1,60,'crop');
w6=imrotate(w1,75,'crop');
w7=imrotate(w1,90,'crop');
w8=imrotate(w1,105,'crop');
w9=imrotate(w1,120,'crop');
w10=imrotate(w1,135,'crop');
w11=imrotate(w1,150,'crop');
w12=imrotate(w1,165,'crop');

a1=imfilter(G,w1);
b1=im2bw(a1);
figure,imshow(b1);
title('0 degree');

a2=imfilter(G,w2);
b2=im2bw(a2);
figure,imshow(b2);
title('15 degree');

a3=imfilter(G,w3);
b3=im2bw(a3);
figure,imshow(b3);
title('30 degree');

a4=imfilter(G,w4);
b4=im2bw(a4);
figure,imshow(b4);
title('45 degree');

a5=imfilter(G,w5);
b5=im2bw(a5);
figure,imshow(b5);
title('60 degree');

a6=imfilter(G,w6);
b6=im2bw(a6);
figure,imshow(b6);
title('75 degree');

a7=imfilter(G,w7);
b7=im2bw(a7);
figure,imshow(b7);
title('90 degree');

a8=imfilter(G,w8);
b8=im2bw(a8);
figure,imshow(b8);
title('105 degree');

a9=imfilter(G,w9);
b9=im2bw(a9);
figure,imshow(b9);
title('120 degree');

a10=imfilter(G,w10);
b10=im2bw(a10);
figure,imshow(b10);
title('135 degree');

a11=imfilter(G,w11);
b11=im2bw(a11);
figure,imshow(b11);
title('150 degree');

a12=imfilter(G,w12);
b12=im2bw(a12);
figure,imshow(b12);
title('165 degree');


b=b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12;
figure,imshow(b);
title('GMF');


se = strel('diamond',1);
bw2 = imdilate(b,se);
figure, imshow(bw2);
title('Dilated');



%se = strel('line',10,30);
%bw2 = imdilate(b,se);
%figure, imshow(bw2);
%title('Dilated');

se1= strel('disk',1);
bw2 = imerode(bw2,se1);
figure, imshow(bw2);
title('eroded');


