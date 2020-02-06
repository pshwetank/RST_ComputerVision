%MATLAB version of the code for the assignment
%Implementing the basics of image processig in the MATLAB environment

%Question 1 
%loadin the image file in matlab
image_rgb = imread('swi.jpg');
%imshow(image_rgb)
image = rgb2gray(image_rgb);
figure()
imshow(image)
title('Grayscale MRI image');
%%%%%%%%%%%%%%%%

%Question 2
%Image Normalization
im_min = double(min(min(image)));
im_max = double(max(max(image)));
y = double(image);
im_norm = (y - im_min)/(im_max - im_min);

%%%%%%%%%%%%%%%%
%Question 3
%Saving the image as PNG file
imwrite(im_norm, 'norm_image.png');


%Question 4
C = double(image);
B = image;

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


%Question 5


