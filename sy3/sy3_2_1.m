% ͼ�񽵼���д�㷨
I = imread('lena600.bmp');      %��ȡ����ͼ��
for i=1:600
    for j=1:600
        H(i,j)=bitand(I(i,j),240);
    end
end
J=imread('kulou600.bmp');      %��ȡ����ͼ��
for i=1:600
    for j=1:600
        H(i,j)=bitor(H(i,j),bitshift(J(i,j),-4));
    end
end
imwrite(H,'downgrade.bmp');    %�洢αװͼ��
subplot(2,2,1); imshow(I); title('ԭʼͼ��') ;     % ��ʾʵ����
subplot(2,2,2); imhist(I); title('ԭʼͼ��ֱ��ͼ') ;
subplot(2,2,3);imshow(H); title('αװ��ͼ��') ;
subplot(2,2,4);imhist(H); title('αװͼ��ֱ��ͼ') ;
