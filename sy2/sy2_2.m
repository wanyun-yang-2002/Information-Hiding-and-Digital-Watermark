% ͼ��ƽ��
I = imread('cat2.bmp');     % ��ȡͼ��
t = 4;      % �������
M = 0;
subplot(2,t,1),imshow(I);
title('ԭʼͼ��');
% ������ͬ���Ĳ������ж�μ��루�˴���Ӹ�˹������
for i = 1:t
    I = imnoise(I,'gaussian',0,0.2);
    % ��ͼ��ת��Ϊdouble�����Ա������
    m = im2double(I);
    M = m + M;
    % ��������ͼ��
    subplot(2,t,i+t),imshow(I);
    title(['�����ͼ��',num2str(i)]);
end
% ������ͼ�����ƽ��
M = M/i;
% ƽ��ͼ��
subplot(2,t,2),imshow(M);
title('ƽ��ͼ��');
