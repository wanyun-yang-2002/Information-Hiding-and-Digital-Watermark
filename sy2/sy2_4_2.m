% 灰度码分解方法
I = imread('lena600.bmp');
% 画出原图像
subplot(3,3,1),imshow(I);
title('原始图像');
[r, c] = size(I);
imageBit = zeros(r,c,8);
% 遍历每一个像素点
for row = 1 : r
    for col = 1 : c
        % 将灰度级转为8位2进制字符串
        bin_str = dec2bin(I(row, col),8);
        % 将2进制字符串转为格雷码
        gray = binary8bit2gray(bin_str);
        for i = 1 : 8
            % 提取对应位置的字符，转型后赋值到对应平面的对应位置
            digit = str2double(gray(i));
            imageBit(row,col,9-i) = digit;
        end
    end
end
imageBit = uint8(imageBit);
[r, c, k] = size(imageBit);

start = 2;
% 分别画出比特平面分层后的图像
for k = 1 : 8
    img_temp = imageBit(1:r,1:c,k);
    subplot(3,3,start);
    imshow(mat2gray(img_temp));
    title(['第',num2str(k),'个位平面']);
    start = start + 1;
end

function gray = binary8bit2gray(binary)
% 将8位二进制码转换为8位格雷码
% binary: 输入的8位二进制码，是一个字符串
% gray: 转换后的8位格雷码，也是一个字符串

% 将二进制码转为数字数组
binary = double(binary) - 48;  % 将字符数组转为数字数组，'0'对应48，'1'对应49

% 计算格雷码
gray = zeros(1, 8);
gray(1) = binary(1);
for i = 2:8
    gray(i) = bitxor(binary(i-1), binary(i));
end

% 将格雷码转为字符数组
gray = char(gray + 48);  % 将数字数组转为字符数组，'0'对应48

end
