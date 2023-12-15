% 二值分解方法
I = double(imread('lena600.bmp'));
[h, w] = size(I);
subplot(3,3,1);
imshow(I,[]);
title('原始图像');
for k=1:8
    for i=1:h
        for j=1:w
            tmp(i,j) = bitget(I(i,j),k);    % bitget函数首先将X(i,j)处灰度值分解为二进制串，然后取第k位
        end
    end
	subplot(3,3,k+1);
	imshow(tmp,[]);
	title(['第',num2str(k),'个位平面']);
end
