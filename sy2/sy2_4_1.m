% ��ֵ�ֽⷽ��
I = double(imread('lena600.bmp'));
[h, w] = size(I);
subplot(3,3,1);
imshow(I,[]);
title('ԭʼͼ��');
for k=1:8
    for i=1:h
        for j=1:w
            tmp(i,j) = bitget(I(i,j),k);    % bitget�������Ƚ�X(i,j)���Ҷ�ֵ�ֽ�Ϊ�����ƴ���Ȼ��ȡ��kλ
        end
    end
	subplot(3,3,k+1);
	imshow(tmp,[]);
	title(['��',num2str(k),'��λƽ��']);
end
