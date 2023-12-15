% 图像平均
I = imread('cat2.bmp');     % 读取图像
t = 4;      % 加噪次数
M = 0;
subplot(2,t,1),imshow(I);
title('原始图像');
% 对其用同样的参数进行多次加噪（此处添加高斯噪声）
for i = 1:t
    I = imnoise(I,'gaussian',0,0.2);
    % 将图像转换为double类型以避免溢出
    m = im2double(I);
    M = m + M;
    % 输出加噪后图像
    subplot(2,t,i+t),imshow(I);
    title(['加噪后图像',num2str(i)]);
end
% 对上述图像进行平均
M = M/i;
% 平均图像
subplot(2,t,2),imshow(M);
title('平均图像');
