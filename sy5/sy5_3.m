% ��ƵˮӡǶ���㷨�����㷨�ǿ����������㷨�ı��֣��ۺ���LSB�㷨����
cover = imread('lena600.bmp') ;
ste_cover = cover;
ste_cover = double( ste_cover ) ;
N=3;  %���������Կ�����˽Կ���е����ƶȣ�1/N
k1=6;  %Ƭ�ʣ�ż������Ҫ��N��������
% �ж�Ƕ����Ϣ���Ƿ����
wat=imread('xiyou.bmp');
[r,t]=size(wat);
[m,n]=size(ste_cover ) ;
if r*t*k1>m* n
    error('Ƕ����Ϣ������, �����ͼ��') ;
end
len_total=r*t;
water=double(wat);
%ˮӡתΪ����1
for k=1:len_total
    if water(k)==0
        water(k)=-1;
    end
end
%��Ƶ����
bi=zeros(k1*len_total,1);
for i=1:len_total
    for j=1:k1
        bi((i-1)*k1+j,1)=water(i);
    end
end
%α����������ɣ�������������
rand('seed',10);
A=rand(m*n,1);
B=2*floor(2*A)-1;  %˽Կ����
rand('seed',20);
BB=rand(m*n,1); 
BB=2*floor(2*BB)-1; %��Կ����
for i=1:m*n
    if mod(i,N)==0
        BB(i,1)=B(i,1);
    end
end
%׼��Ƕ���lsb��Ϣ
lsb=zeros(m*n,1);
for i=1:len_total*k1
    lsb(i,1)=(bi(i,1)*B(i,1)+1)/2;
end
for i=len_total*k1+1:m*n
    lsb(i,1)=B(i,1);
end
%Ƕ��ˮӡ��LSB
for i=1:m*n
    ste_cover(i)=bitand(ste_cover(i),254)+lsb(i,1);
end
ste_cover=uint8(ste_cover);
% ��ʾʵ����
subplot(2,2,1); imshow( cover); title('ԭʼͼ��') ;
subplot(2,2,2); imhist( cover); title('ԭʼͼ��ֱ��ͼ') ;
subplot(2,2,3);imshow( ste_cover); title('��ˮӡ��ͼ��') ;
subplot(2,2,4);imhist( ste_cover); title('��ˮӡͼ��ֱ��ͼ') ;
imwrite(ste_cover,'lena_kuopin.bmp');
