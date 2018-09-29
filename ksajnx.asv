clc;
clear all;
close all;
A=imread('C:\Documents and Settings\hp.PC209931236527.002\Desktop\BE-PROJECT\DRIVE\DRIVE\test\images\01_test.tif');
figure,imshow(A);
title('original');
%Green Component
G = A(:,:,2);
figure;
image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
[m n]=size(G);

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
figure,imshow(G);
title('homogenisation');

%GRAY LEVEL BASED FEATURES

G=padarray(G,[1 1]);
[x y]=size(G);
 for i=2:18
     for j=2:18
         w=[G(i-1,j+1) G(i,j+1) G(i+1,j+1); G(i-1,j) G(i,j) G(i+1,j); G(i-1,j-1) G(i,j-1) G(i+1,j-1)];   
         f1(1,1)=abs(G(1,1)- min(min(w)));
         f2(1,1)=abs(max(max(w))-G(1,1));
         f3(1,1)=abs(G(1,1)-mean(mean(w)));
         f4(1,1)=abs(std(std(w)));
         f5(1,1)=abs(G(1,1));
     end
 end
 disp(w);


%top hat transform
Gc=1-G;
% figure,imshow(Gc);
se1= strel('disk',8);
Gt = imtophat(Gc,se1);
Gt=im2uint8(Gt);
[m n]=size(Gt);
figure,imshow(Gt);
title('top hat');



%moment invariant based features
for i=1:17
    for j=1:17
        sub(i,j)=Gt(i+334,j+10);
    end
end
figure,imshow(sub);
title('sub image');

% %newsubimage
% % f(x)=exp((-0.5.*(x)^2)./(1.7)^2);
% h = fspecial('gaussian', [17 17], 1.7);
% t=imfilter(sub,h);
% for i=1:17
%     for j=1:17
%         subn(i,j)=sub(i,j).* t(i,j);
%     end
% end
% figure,imshow(subn);
% title('new sub image');


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

f611(1,1)=abs(log(phi1));
f7(1,1)=abs(log(phi2));

