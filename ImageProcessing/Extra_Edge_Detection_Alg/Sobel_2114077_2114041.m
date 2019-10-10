%Papadopoulos Giwrgos 
%Binary Image

clear all;
close all;
clc;

B=imread('cameraman.tif');

C=double(B); %vazoume tis times tis gray eikonas se 2x2 pinaka

%afairoume 2, dioti an exoume eikona 512x512.. tha tre3ei apo 0-511 
% (opote -1)
% kai meta logw tou loop afairoume allo -1...opote sinolika -2
% gia na min vgoume ektos oriwn

for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end

imshow(B); title('after Sobel gradient');

%tropos 1 - Thresholding
%me stadar default threshold
    BW = imbinarize(B);
    figure
    imshow(BW); title('after 0.5 threshold apply');
	BW=~BW; %allagi blace se white 
	figure;imshow(BW);title('Apo black se white');
    
%tropos 2 - Thresholding
%enallaktiki methodos metatropis eikonas se binary k 
%taytoxrona efarmogi threshold . thresh = N. 
%vazoume diafores times sto thresh.

    %thresh = 0.4;
    %BW = im2bw(B,thresh);
    %figure, imshow(BW); title('after threshold apply');
	%BW=~BW; %allagi blace se white 
	%figure;imshow(BW);title('Apo black se white');