clc;
clear all;
close all;
A=imread('C:\Documents and Settings\hp.PC209931236527.002\Desktop\BE-PROJECT\DRIVE\DRIVE\test\images\01_test.tif');
[m n]=size(A);
figure,imshow(A);
title('original');
aa=rgb2gray(A);

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
figure,imshow(G);
title('opening');
% s=mode(mode(G));
% G=G-ones(m,n)*s;
% figure,imshow(G);

%background homogenization
h=fspecial('average',[3 3]);
M=imfilter(G,h);
figure,imshow(M);
title('smoothening');

h = fspecial('gaussian', [9 9], 1.8);
G=imfilter(M,h);
figure,imshow(G);
title('further smoothening');

h=fspecial('average',[69 69]);
M=imfilter(G,h);
figure,imshow(M);
title('background');

G=G-M;
%G=im2uint8(G);
figure,imshow(G);
title('shade corrected image');
[m n]=size(G);

[counts,X]=imhist(G);
figure,imhist(G);
title('hist of image');

l=mode(mode(G));
G=im2uint8(G);

for i=1:m
    for j=1:n
C(i,j)=G(i,j)+128-l;

if(C(i,j)<0)
    gout(i,j)=0;
else if(C(i,j)>255)
        gout(i,j)=255;
    else
        gout(i,j)=C(i,j);
    end
end
    end
end
figure,imshow(gout);
title('homogenised image');


% [m n]=size(G);
% u=0.5-l;
% G=G+ones(m,n)*u;
% figure,imshow(G);
% title('homogenisation');

%top hat transform
gout=im2double(gout);
Gc=1-gout;
figure,imshow(Gc);
se1= strel('disk',3);
Gt = imtophat(Gc,se1);
%G=Gc-Gt;
figure,imshow(Gt);
title('top hat');
Gt=Gt.*70;
figure,imshow(Gt);
title('top hat');

M = imadjust(Gt,[],[],0.6);
figure,imshow(M);
title('gamma correction');

cmap = contrast(M);
figure,imshow(M);
title('contrast enhancement');

t=0.05;
for i=1:m
    for j=1:n
if(M(i,j)>=t)
    M(i,j)=255;
else
    M(i,j)=0;
end
    end
end
figure,imshow(M);
title('bw image');

[counts,X]=imhist(G);
figure,imhist(G);
title('hist of preprocessed image');

%thresholding
level = graythresh(G);
BW = im2bw(G,level);
figure,imshow(BW);
title('thresholded image');

%neural network
[m n]=size(G);
w = [1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1];
for i=1:9
    for j=1:9
        c(i,j)=G(i,j)*w(i,j);
    end
end
centre=c(5,5);
    
        