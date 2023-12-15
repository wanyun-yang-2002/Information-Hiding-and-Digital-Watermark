% 图像加噪
I = imread('cat2.bmp');     % 读取图像
J = imnoise(I,'gaussian',0,0.1);     % 高斯噪声
K = imnoise(I,'salt & pepper',0.05);     % 椒盐噪声
% 输出原图和加噪后的图像
subplot(1,3,1),imshow(I);
title('原始图像');
subplot(1,3,2),imshow(J);
title('添加高斯噪声');
subplot(1,3,3),imshow(K);
title('添加椒盐噪声');