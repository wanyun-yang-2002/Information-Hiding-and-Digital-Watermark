% ͼ�����
I = imread('cat2.bmp');     % ��ȡͼ��
J = imnoise(I,'gaussian',0,0.1);     % ��˹����
K = imnoise(I,'salt & pepper',0.05);     % ��������
% ���ԭͼ�ͼ�����ͼ��
subplot(1,3,1),imshow(I);
title('ԭʼͼ��');
subplot(1,3,2),imshow(J);
title('��Ӹ�˹����');
subplot(1,3,3),imshow(K);
title('��ӽ�������');