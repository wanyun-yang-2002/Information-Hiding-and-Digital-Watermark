% ��ͼ����м򵥵ĻҶ�ӳ�䣺ƽ�������桢������
% ��ȡͼ��
I = im2double(imread('lena600.bmp'));
I_square = I.^2;    % ��ƽ��
I_negative = 1-I;   % ����
I_root=sqrt(I);     % ����
% ���ͼƬ
subplot(2,2,1),imshow(I);
title('ԭʼͼ��');
subplot(2,2,2),imshow(I_square);
title('ƽ��ͼ');
subplot(2,2,3),imshow(I_negative);
title('����ͼ');
subplot(2,2,4),imshow(I_root);
title('����ͼ');