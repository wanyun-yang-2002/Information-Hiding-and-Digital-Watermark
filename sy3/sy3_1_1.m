% LSB��д�㷨
cover = imread('cat2.bmp') ;    % ��ȡ����ͼ��
ste_cover = cover;
ste_cover = double( ste_cover ) ;
f_id = fopen('test.txt', 'r') ;    % ��ȡ�����ص��ı��ļ�������ת��Ϊ����������
[ msg, len_total] = fread( f_id, 'ubit1') ; 
[m,n] = size( ste_cover ) ;
if len_total > m* n       % �ж�Ƕ����Ϣ���Ƿ����
    error( 'Ƕ����Ϣ������, �����ͼ��') ;
end
p = 1;           % p ��Ϊ��ϢǶ��λ��������
for f2 =1:n
for f1 =1:m
    ste_cover( f1, f2) = ste_cover( f1, f2) -mod( ste_cover( f1, f2) , 2) + msg( p, 1) ;
    if p == len_total
       break;
    end
    p = p + 1;
end
    if p == len_total
        break;
    end
end
ste_cover = uint8( ste_cover ) ;
imwrite( ste_cover,'gen_lsb.bmp') ;  % ����������Ϣ��ͼ�񣬲����д洢
subplot(2,2,1); imshow( cover); title('ԭʼͼ��') ;     % ��ʾʵ����
subplot(2,2,2); imhist( cover); title('ԭʼͼ��ֱ��ͼ') ;
subplot(2,2,3);imshow( ste_cover); title('������Ϣ��ͼ��') ;
subplot(2,2,4);imhist( ste_cover); title('������Ϣͼ��ֱ��ͼ') ;
