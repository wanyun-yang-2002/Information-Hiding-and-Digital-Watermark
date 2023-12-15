% �Ҷ���ֽⷽ��
I = imread('lena600.bmp');
% ����ԭͼ��
subplot(3,3,1),imshow(I);
title('ԭʼͼ��');
[r, c] = size(I);
imageBit = zeros(r,c,8);
% ����ÿһ�����ص�
for row = 1 : r
    for col = 1 : c
        % ���Ҷȼ�תΪ8λ2�����ַ���
        bin_str = dec2bin(I(row, col),8);
        % ��2�����ַ���תΪ������
        gray = binary8bit2gray(bin_str);
        for i = 1 : 8
            % ��ȡ��Ӧλ�õ��ַ���ת�ͺ�ֵ����Ӧƽ��Ķ�Ӧλ��
            digit = str2double(gray(i));
            imageBit(row,col,9-i) = digit;
        end
    end
end
imageBit = uint8(imageBit);
[r, c, k] = size(imageBit);

start = 2;
% �ֱ𻭳�����ƽ��ֲ���ͼ��
for k = 1 : 8
    img_temp = imageBit(1:r,1:c,k);
    subplot(3,3,start);
    imshow(mat2gray(img_temp));
    title(['��',num2str(k),'��λƽ��']);
    start = start + 1;
end

function gray = binary8bit2gray(binary)
% ��8λ��������ת��Ϊ8λ������
% binary: �����8λ�������룬��һ���ַ���
% gray: ת�����8λ�����룬Ҳ��һ���ַ���

% ����������תΪ��������
binary = double(binary) - 48;  % ���ַ�����תΪ�������飬'0'��Ӧ48��'1'��Ӧ49

% ���������
gray = zeros(1, 8);
gray(1) = binary(1);
for i = 2:8
    gray(i) = bitxor(binary(i-1), binary(i));
end

% ��������תΪ�ַ�����
gray = char(gray + 48);  % ����������תΪ�ַ����飬'0'��Ӧ48

end
