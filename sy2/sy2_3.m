% 图像滤波
I = imread('tang600.bmp');     % 读取图像
p = 15;       % 参数
% 均值滤波
J = filter2(fspecial('average',p),I)/255;   % p表示生成p*p的矩阵
% 中值滤波
K = medfilt2(I,[p,p]);
% 输出原图及处理后的图像
subplot(1,3,1),imshow(I);
title('原始图像');
subplot(1,3,2),imshow(J);
title('均值滤波后图像');
subplot(1,3,3),imshow(K);
title('中值滤波后图像');
suptitle(['均值滤波与中值滤波参数均为',num2str(p)]);
