% ͼ�񽵼���ȡ�㷨
% I = imread('E:\xiyou\ʵ��4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\downgrade_MEDIAN_5.bmp');
for i=1:50
    for j=1:50
        H(i,j)=bitshift(I(i,j),4);
    end
end
J=imread('lena600.bmp');
subplot(2,2,1); imshow(J); title('ԭʼͼ��') ;       % ��ʾʵ����
subplot(2,2,2); imhist(J); title('ԭʼͼ��ֱ��ͼ') ;
subplot(2,2,3);imshow(H); title('�ָ���ͼ��') ;
subplot(2,2,4);imhist(H); title('�ָ�ͼ��ֱ��ͼ') ;
