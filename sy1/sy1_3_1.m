% 对图像进行简单的灰度映射：平方、求逆、开方等
% 读取图像
I = im2double(imread('lena600.bmp'));
I_square = I.^2;    % 求平方
I_negative = 1-I;   % 求逆
I_root=sqrt(I);     % 开方
% 输出图片
subplot(2,2,1),imshow(I);
title('原始图像');
subplot(2,2,2),imshow(I_square);
title('平方图');
subplot(2,2,3),imshow(I_negative);
title('求逆图');
subplot(2,2,4),imshow(I_root);
title('开方图');