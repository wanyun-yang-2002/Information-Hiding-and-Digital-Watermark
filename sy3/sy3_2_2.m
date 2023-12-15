% 图像降级提取算法
% I = imread('E:\xiyou\实验4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\downgrade_MEDIAN_5.bmp');
for i=1:50
    for j=1:50
        H(i,j)=bitshift(I(i,j),4);
    end
end
J=imread('lena600.bmp');
subplot(2,2,1); imshow(J); title('原始图像') ;       % 显示实验结果
subplot(2,2,2); imhist(J); title('原始图像直方图') ;
subplot(2,2,3);imshow(H); title('恢复的图像') ;
subplot(2,2,4);imhist(H); title('恢复图像直方图') ;
