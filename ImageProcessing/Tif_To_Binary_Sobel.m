%Papadopoulos Giwrgos 
%Binary Image

clear all;
close all;
clc;


B = imread('cameraman.tif');
D = double(B);


BW = imbinarize(B); %metatropi tif--> binary

C=double(BW); %vazoume tis times tis gray eikonas se 2x2 pinaka

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
        BW(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
imshow(BW); title('after Sobel gradient');

BW=~BW; %allagi blace se white 
figure;imshow(BW);title('Apo black se white');


%Write the bw in a binary file 
    %fid = fopen ('cameraman_bw.bin', 'w');.
    %[fid,msg] = fopen('cameraman_bw.bin','w');
    %if fid < 0; disp(msg); end %error nsg
    %count = fwrite (fid, BW, 'uint8' );
    %fclose (fid);

%Read the bw from the binary file and show the binary bw image in a new
    %figure
    %fid2 = fopen ('cameraman_bw.bin', 'rb');
    %[BW2, count] = fread (fid2, [512,512], 'uint8' );
    %fclose (fid2);
    %figure
    %imshow(BW2)





