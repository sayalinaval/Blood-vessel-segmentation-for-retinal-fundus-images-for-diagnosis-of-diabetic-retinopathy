clc;
clear all;
close all;
A=imread('D:\sayali\studies\BE-PROJECT\DRIVE\DRIVE\training\images\21_training.tif');
[m n]=size(A);
figure,imshow(A);
title('original');
% aa=im2bw(A,0.4);
% figure,imshow(aa);

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

%preprocessing
%opening
G=im2double(G);
[m n]=size(G);
G=imopen(G,strel('disk',3));
% figure,imshow(G);
% title('opening');
s=mode(mode(G));
G=G-ones(m,n)*s;
% figure,imshow(G);


%background homogenization
h=fspecial('average',[69 69]);
M=imfilter(G,h);
% figure,imshow(M);
% title('background');
G=G-M;
G=im2double(G);
% figure,imshow(G);
% title('shade corrected image');
[m n]=size(G);

[counts,X]=imhist(G);
% figure,imhist(G);
% title('hist of image');

[m n]=size(G);
l1=mode(mode(G));
u=0.5-l1;
G=G+ones(m,n)*u;
% figure,imshow(G);
% title('homogenisation');

%top hat transform
Gc=1-G;
% figure,imshow(Gc);
se1= strel('disk',8);
Gt = imtophat(Gc,se1);
Gt=im2uint8(Gt);
[m n]=size(Gt);
figure,imshow(Gt);
title('top hat');

%GRAY LEVEL BASED FEATURES

G=padarray(G,[1 1]);
[x y]=size(G);
%G=im2uint8(G);
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
 disp(w);