% 图像降级隐写算法
I = imread('lena600.bmp');      %读取载体图像
for i=1:600
    for j=1:600
        H(i,j)=bitand(I(i,j),240);
    end
end
J=imread('kulou600.bmp');      %读取秘密图像
for i=1:600
    for j=1:600
        H(i,j)=bitor(H(i,j),bitshift(J(i,j),-4));
    end
end
imwrite(H,'downgrade.bmp');    %存储伪装图像
subplot(2,2,1); imshow(I); title('原始图像') ;     % 显示实验结果
subplot(2,2,2); imhist(I); title('原始图像直方图') ;
subplot(2,2,3);imshow(H); title('伪装的图像') ;
subplot(2,2,4);imhist(H); title('伪装图像直方图') ;
