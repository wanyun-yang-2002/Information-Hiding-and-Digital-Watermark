% DCT信息隐藏算法
frr = fopen('test.txt','r');
[msg,count] = fread(frr,'ubit1') ;
fclose(frr) ;
data0 = imread('lena600.bmp') ;
% 将图像矩阵转为double 型
data = double(data0) /255;
% 对图像分块
T = dctmtx( 8) ;
% 对分块图像做DCT 变换
IMDCT=blkproc(data,[8 8 ],'P1*x*P2',T,T') ;
% 产生随机的块选择, 确定图像块的首地址
[ row, col] = size( IMDCT) ;
row = floor(row/8) ;
col = floor(col/8) ;
a = zeros( [ row col] ) ;
[k1,k2] = randinterval(a,count,12) ;  %此处引用程序1给出的函数，生成随机像素位置
for i = 1:count          %计算随机块的位置
   k1(1,i) = (k1(1,i)-1)*8+1;
   k2(1,i) = (k2(1,i)-1)*8+1;
end     
% 信息嵌入
temp=0;
H=0.2;   %控制参数，保证嵌入结果的正确性。
for i=1:count
   if msg(i,1)==0
       if IMDCT(k1(i)+4,k2(i)+1)>IMDCT(k1(i)+3,k2(i)+2)
          temp=IMDCT(k1(i)+4,k2(i)+1);
          IMDCT(k1(i)+4,k2(i)+1)=IMDCT(k1(i)+3,k2(i)+2);
          IMDCT(k1(i)+3,k2(i)+2)=temp;
       end
       else
       if IMDCT(k1(i)+4,k2(i)+1)<IMDCT(k1(i)+3,k2(i)+2)
          temp=IMDCT(k1(i)+4,k2(i)+1);
          IMDCT(k1(i)+4,k2(i)+1)=IMDCT(k1(i)+3,k2(i)+2);
          IMDCT(k1(i)+3,k2(i)+2)=temp;
       end
    end
    if  IMDCT(k1(i)+4,k2(i)+1)>IMDCT(k1(i)+3,k2(i)+2)
     IMDCT(k1(i)+3,k2(i)+2)=IMDCT(k1(i)+3,k2(i)+2)-H; % 将小系数调整更小
    else
        IMDCT(k1(i)+4,k2(i)+1)=IMDCT(k1(i)+4,k2(i)+1)-H;
    end
end
result = blkproc(IMDCT,[8 8],'P1*x*P2',T',T);
imwrite(result,'lenadct.bmp') ;
subplot(2,2,1); imshow(data); title('原始图像') ;   % 显示实验结果
subplot(2,2,2); imhist(data); title('原始图像直方图') ;
subplot(2,2,3);imshow(result); title('伪装图像') ;
subplot(2,2,4);imhist(result); title('伪装图像直方图');
