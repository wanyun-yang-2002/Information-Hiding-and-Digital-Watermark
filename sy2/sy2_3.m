% ͼ���˲�
I = imread('tang600.bmp');     % ��ȡͼ��
p = 15;       % ����
% ��ֵ�˲�
J = filter2(fspecial('average',p),I)/255;   % p��ʾ����p*p�ľ���
% ��ֵ�˲�
K = medfilt2(I,[p,p]);
% ���ԭͼ��������ͼ��
subplot(1,3,1),imshow(I);
title('ԭʼͼ��');
subplot(1,3,2),imshow(J);
title('��ֵ�˲���ͼ��');
subplot(1,3,3),imshow(K);
title('��ֵ�˲���ͼ��');
suptitle(['��ֵ�˲�����ֵ�˲�������Ϊ',num2str(p)]);
