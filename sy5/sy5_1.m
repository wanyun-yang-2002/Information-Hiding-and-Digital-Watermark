% PatchˮӡǶ���㷨
PP=imread('lena600.bmp');
PEM=PP;
N=10000;     %���λ�öԵ���Ŀ
K=30;        %�����������ȡֵ����
s=10;         %������Կ������������
%Ƕ�룬���ĻҶ�ֵ
rand('seed',s);
A=rand(1,2*N);
B=floor(K*A)+1;
LO=0;
for k=1:N
    LO=LO+B(2*k-1);
    PEM(LO)=PP(LO)+1;
    LO=LO+B(2*k);
    PEM(LO)=PP(LO)-1;
end
subplot(2,2,1);imshow(PP);title('ԭʼͼ');
subplot(2,2,2);imhist(PP);title('ԭʼͼֱ��ͼ')
subplot(2,2,3);imshow(PEM);title('��ˮӡͼ');
subplot(2,2,4);imhist(PEM);title('��ˮӡͼֱ��ͼ')
