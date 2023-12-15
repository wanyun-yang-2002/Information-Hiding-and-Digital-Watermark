% 彩色图转灰度图，灰度图转二值图
I = imread('cat.bmp');  % 读取图像
J = rgb2gray(I);        % 转灰度图
K = im2bw(J);           % 转二值图
% 输出图片
subplot(1,3,1),imshow(I);
title('原始图像');
subplot(1,3,2),imshow(J);
title('灰度图');
subplot(1,3,3),imshow(K);
title('二值图');
imwrite(J,'1_2_3.bmp');