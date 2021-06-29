photo=imread('test4.jpg');
grey=rgb2gray(photo);
grey2=rgb2gray(photo);
grey3=rgb2gray(photo);
grey_org=rgb2gray(photo);
%task 4
h = [1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1;
     1, 1, 1, 1, 1]/25;

 point = 2;
 
noise = imnoise(grey,'gaussian',0.02);
subplot(4,1,1);
imshow(noise);
title('noise');
for row = (point+1):size(grey,1)-(point+1)
    for col = (point+1):size(grey,2)-(point+1)
        grey2(row,col)=conv2(noise((row-point):(row+point),(col-point):(col+point)),h, 'valid')/sum(h,'all');
    end
end
subplot(4,1,2);
imshow(grey2);
title('smooth');

h_sharp = [0, 0, -1, 0, 0;
           0, -1, -1, -1, 0;
           -1, -1, 100, -1, -1;
           0, -1, -1, -1, 0;
           0, 0, -1, 0, 0];
       
for row = (point+1):size(grey,1)-(point+1)
    for col = (point+1):size(grey,2)-(point+1)
        grey3(row,col)=conv2(noise((row-point):(row+point),(col-point):(col+point)),h_sharp, 'valid')/sum(h_sharp,'all');
    end
end
Peak_signal_to_noise_ratio=psnr(grey3, grey);
subplot(4,1,3);
imshow(grey3);
title('sharp');
ylabel(Peak_signal_to_noise_ratio);

%task 6
alfa = 1;

U = grey_org - alfa*(grey_org-grey2);
subplot(4,1,4);
imshow(U);
title('unsmooth')
ylabel(psnr(U,grey_org));

