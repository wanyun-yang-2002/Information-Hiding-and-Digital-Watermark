% 扩频水印嵌入算法（本算法是课堂上所讲算法的变种，综合了LSB算法。）
cover = imread('lena600.bmp') ;
ste_cover = cover;
ste_cover = double( ste_cover ) ;
N=3;  %衡量随机公钥与随机私钥序列的相似度：1/N
k1=6;  %片率，偶数，需要被N所整除！
% 判断嵌入消息量是否过大
wat=imread('xiyou.bmp');
[r,t]=size(wat);
[m,n]=size(ste_cover ) ;
if r*t*k1>m* n
    error('嵌入消息量过大, 请更换图像') ;
end
len_total=r*t;
water=double(wat);
%水印转为正负1
for k=1:len_total
    if water(k)==0
        water(k)=-1;
    end
end
%扩频部分
bi=zeros(k1*len_total,1);
for i=1:len_total
    for j=1:k1
        bi((i-1)*k1+j,1)=water(i);
    end
end
%伪随机序列生成，充满整个载体
rand('seed',10);
A=rand(m*n,1);
B=2*floor(2*A)-1;  %私钥序列
rand('seed',20);
BB=rand(m*n,1); 
BB=2*floor(2*BB)-1; %公钥序列
for i=1:m*n
    if mod(i,N)==0
        BB(i,1)=B(i,1);
    end
end
%准备嵌入的lsb信息
lsb=zeros(m*n,1);
for i=1:len_total*k1
    lsb(i,1)=(bi(i,1)*B(i,1)+1)/2;
end
for i=len_total*k1+1:m*n
    lsb(i,1)=B(i,1);
end
%嵌入水印到LSB
for i=1:m*n
    ste_cover(i)=bitand(ste_cover(i),254)+lsb(i,1);
end
ste_cover=uint8(ste_cover);
% 显示实验结果
subplot(2,2,1); imshow( cover); title('原始图像') ;
subplot(2,2,2); imhist( cover); title('原始图像直方图') ;
subplot(2,2,3);imshow( ste_cover); title('加水印的图像') ;
subplot(2,2,4);imhist( ste_cover); title('加水印图像直方图') ;
imwrite(ste_cover,'lena_kuopin.bmp');
