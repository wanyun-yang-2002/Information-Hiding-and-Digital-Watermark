% Patch水印嵌入算法
PP=imread('lena600.bmp');
PEM=PP;
N=10000;     %随机位置对的数目
K=30;        %产生随机数的取值上限
s=10;         %种子密钥，可自行设置
%嵌入，更改灰度值
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
subplot(2,2,1);imshow(PP);title('原始图');
subplot(2,2,2);imhist(PP);title('原始图直方图')
subplot(2,2,3);imshow(PEM);title('加水印图');
subplot(2,2,4);imhist(PEM);title('加水印图直方图')
