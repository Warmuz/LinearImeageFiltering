photo=imread('test4.jpg');
grey=rgb2gray(photo);
grey2=rgb2gray(photo);
grey3=rgb2gray(photo);

% task 2

%mask 5x5

h = [1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1]/25;

% h1 = ones(17,17);
% sizeofmask1 = size(h,1)/2-0.5;
% sizeofmask2 = size(h1,1)/2-0.5;

point = 2;

% subplot(2,1,1)
% imshow(grey);
title('orginal');
for row = (point+1):size(grey,1)-(point+1)
    for col = (point+1):size(grey,2)-(point+1)
        grey2(row,col)=conv2(grey((row-point):(row+point),(col-point):(col+point)),h, 'valid')/sum(h,'all');
    end
end
% subplot(2,1,1)
% imshow(grey3);
% title('orginal');

% subplot(2,1,2)
% imshow(grey2);
% title('my blured function');
% 
% new = imfilter(grey3, h);
% subplot(2,1,2)
% imshow(new);
% title('imfilter')

%task 4

noise = imnoise(grey3,'gaussian',0.02);
imshow(noise);
