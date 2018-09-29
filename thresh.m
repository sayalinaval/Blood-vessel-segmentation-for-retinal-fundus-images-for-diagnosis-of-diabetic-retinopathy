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

%T=0.5*(double(min(G(:)))+double(max(G(:))));
T=0.5*(60+150);
done=false;
while ~ done
    c1=G>=T;
    c2=60<G<T;
    Tnext=0.5*(mean(G(c1))+mean(G(c2)));
    done=abs(T-Tnext)<0.5;
    T=Tnext;
end
level=T/255;
BW = im2bw(G,level);
figure,imshow(BW);