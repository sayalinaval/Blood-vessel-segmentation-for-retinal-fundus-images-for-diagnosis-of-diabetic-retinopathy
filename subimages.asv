clc;
clear all;
close all;

clc;
clear all;
close all;
A=imread('C:\Documents and Settings\hp.PC209931236527.002\Desktop\BE-PROJECT\DRIVE\DRIVE\test\images\01_test.tif');
[m n]=size(A);
% figure,imshow(A);
% title('original');
aa=rgb2gray(A);

%Green Component
G = A(:,:,2);
figure;
image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;

[m n]=size(G);
% figure,imshow(G);
% title('green');
% [counts,X]=imhist(G);
% figure,imhist(G);
% title('hist of green image');

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
%G=im2uint8(G);
% figure,imshow(G);
% title('shade corrected image');
[m n]=size(G);

[counts,X]=imhist(G);
% figure,imhist(G);
% title('hist of image');

%G=im2double(G);
[m n]=size(G);
l=mode(mode(G));
u=0.5-l;
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

%subimages
for i=1:17
    for j=1:17
        sub1(i,j)=Gt(i+334,j+10);
    end
end

for i=1:17
    for j=1:17
        sub2(i,j)=Gt(i+334,j+12);
    end
end

for i=1:17
    for j=1:17
        sub3(i,j)=Gt(i+89,j+264);
    end
end

for i=1:17
    for j=1:17
        sub4(i,j)=Gt(i+91,j+265);
    end
end

for i=1:17
    for j=1:17
        sub5(i,j)=Gt(i+235,j+110);
    end
end

for i=1:17
    for j=1:17
        sub6(i,j)=Gt(i+237,j+111);
    end
end

for i=1:17
    for j=1:17
        sub7(i,j)=Gt(i+468,j+288);
    end
end

for i=1:17
    for j=1:17
        sub8(i,j)=Gt(i+464,j+287);
    end
end




%subimage 2
for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+334,j+12);
    end
end
figure,imshow(sub);
title('sub image');

%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(2)=abs(log(phi1));
f7(2)=abs(log(phi2));

%subimage 3
for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+89,j+264);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(3)=abs(log(phi1));
f7(3)=abs(log(phi2));

%subimage 4

for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+91,j+265);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(4)=abs(log(phi1));
f7(4)=abs(log(phi2));

%subimage 5
for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+235,j+110);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(5)=abs(log(phi1));
f7(5)=abs(log(phi2));

%subimage 6
for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+237,j+111);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(1,1)=abs(log(phi1));
f7(1,1)=abs(log(phi2));
%subimage 7
for i=1:17
    for j=1:17
        sub3(i,j)=Gt(i+468,j+288);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(7)=abs(log(phi1));
f7(7)=abs(log(phi2));

%subimage 8
for i=1:17
    for j=1:17
        sub3(i,j)=Gt(i+464,j+287);
    end
end

figure,imshow(sub);
title('sub image');


%moments
for i=1:17
    for j=1:17
        s11(i,j)=(i^0)*(j^0)*sub(i,j);
    end
end
mo(1,1)=sum(sum(s11));

for i=1:17
    for j=1:17
        s12(i,j)=(i^0)*(j^1)*sub(i,j);
    end
end
mo(1,2)=sum(sum(s12));

for i=1:17
    for j=1:17
        s13(i,j)=(i^0)*(j^2)*sub(i,j);
    end
end
mo(1,3)=sum(sum(s13));

for i=1:17
    for j=1:17
        s21(i,j)=(i^1)*(j^0)*sub(i,j);
    end
end
mo(2,1)=sum(sum(s21));

for i=1:17
    for j=1:17
        s22(i,j)=(i^1)*(j^1)*sub(i,j);
    end
end
mo(2,2)=sum(sum(s22));

for i=1:17
    for j=1:17
        s31(i,j)=(i^2)*(j^0)*sub(i,j);
    end
end
mo(3,1)=sum(sum(s31));

%central moment
ib=mo(2,1)./mo(1,1);
jb=mo(1,2)./mo(1,1);

for i=1:17
    for j=1:17
        sc22(i,j)=((i-ib)^1)*((j-jb)^1)*sub(i,j);
    end
end
cen(2,2)=sum(sum(sc22));

for i=1:17
    for j=1:17
        sc11(i,j)=((i-ib)^0)*((j-jb)^0)*sub(i,j);
    end
end
cen(1,1)=sum(sum(sc11));

for i=1:17
    for j=1:17
        sc13(i,j)=((i-ib)^0)*((j-jb)^2)*sub(i,j);
    end
end
cen(1,3)=sum(sum(sc13));

for i=1:17
    for j=1:17
        sc31(i,j)=((i-ib)^2)*((j-jb)^0)*sub(i,j);
    end
end
cen(3,1)=sum(sum(sc31));

%normalized central moment
eta(3,1)=cen(3,1)./((cen(1,1))^2);
eta(1,3)=cen(1,3)./((cen(1,1))^2);
eta(2,2)=cen(2,2)./((cen(1,1))^2);

phi1=eta(3,1)+eta(1,3);
phi2=((eta(1,3)+eta(3,1))^2)+4*((eta(2,2)^2));

f6(8)=abs(log(phi1));
f7(8)=abs(log(phi2));