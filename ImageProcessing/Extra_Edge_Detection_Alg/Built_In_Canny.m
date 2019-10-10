%Papadopoulos Giwrgos 
%Canny Edge Detection,
%Xrisimopoiei thn etoimi sinartisi

clear all;
close all;
clc;

im=imread('cameraman.tif');figure;imshow(im)
im=im(1:512,1:512); %megethos eikonas

final=double(im);  %vazoume tis times tis gray eikonas se 2x2 pinaka
m=median(final,5); % xrisimopoioume median gia pio kalo apotelesma
        %afairei to noise tis eikonas
        %dimiourgoume pinaka 5x1 
figure;imshow(uint8(m));title('Me median filtro');    
        
bw=edge(final,'canny',0.3);
figure;imshow(bw);title('After Canny alg');
bw=~bw; %apo black se white
figure;imshow(bw);title('Apo black se white');
