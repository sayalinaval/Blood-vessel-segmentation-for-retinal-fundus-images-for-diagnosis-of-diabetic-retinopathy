clc;
clear all;
close all;

final_img=imread('C:\Users\Sayali\Pictures\original.png');
input_img=imread('C:\Users\Sayali\Pictures\green.png');
ref_img=imread('C:\Users\Sayali\Pictures\red.png');
[m n]=size(input_img);
mn=m*n;

pdf_main=zeros(1,256);
pdf_ref=zeros(1,256);
cdf_main=zeros(1,256);
cdf_ref=zeros(1,256);
tmp=zeros(1,256);
final=zeros(m,n);
%a=0;
%b=0;

for k=1:m
        for l=1:n
            for r=0:255
                if(input_img(k,l)==r)
                    pdf_main(1,r+1)=pdf(1,r+1)+1;
                end
           
            end
        end
end

for k=1:m
        for l=1:n
            for r=0:255
                if(ref_img(k,l)==r)
                    pdf_ref(1,r+1)=pdf(1,r+1)+1;
                end
           
            end
        end
end
sum=0;
for i=1:256
    sum=sum+pdf_main(1,i);
    cdf_main(1,i)=sum;
end
sum=0;

for i=1:256
    sum=sum+pdf_ref(1,i);
    cdf_ref(1,i)=sum;
end
for i=1:256
    for j=1:256
        if cdf_main(1,i)==cdf_ref(1,j)
            k=j;
            break;
        else if cdf_main(1,i)< cdf_ref(1,j)
                k=j-1;
                break;
            end
        end
    end
    tmp(1,i)=k;
end

for i=1:m
    for j=1:n
        for u=1:256
             if input_img(i,j)== u
                 final_img(i,j)=tmp(1,u);
                 break;
             end
        end
    end
end
subplot(3,3,1);
imshow(input_img);
title('Input image');

subplot(3,3,2);
plot(pdf_main);
title('PDF Input');

subplot(3,3,3);
plot(cdf_main);
title('CDF Input');

subplot(3,3,4);
imshow(ref_img);
title('Reference image');


subplot(3,3,5);
plot(pdf_ref);
title('PDF Reference');


subplot(3,3,6);
plot(cdf_ref);
title('CDF Reference');

subplot(3,3,7);
imshow(final_img);
title('Final image');

subplot(3,3,8);
plot(tmp);
title('Transformation function');