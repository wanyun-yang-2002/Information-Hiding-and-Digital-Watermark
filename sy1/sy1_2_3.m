% ��ɫͼת�Ҷ�ͼ���Ҷ�ͼת��ֵͼ
I = imread('cat.bmp');  % ��ȡͼ��
J = rgb2gray(I);        % ת�Ҷ�ͼ
K = im2bw(J);           % ת��ֵͼ
% ���ͼƬ
subplot(1,3,1),imshow(I);
title('ԭʼͼ��');
subplot(1,3,2),imshow(J);
title('�Ҷ�ͼ');
subplot(1,3,3),imshow(K);
title('��ֵͼ');
imwrite(J,'1_2_3.bmp');