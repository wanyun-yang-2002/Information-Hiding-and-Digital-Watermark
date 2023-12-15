% LSB隐写算法
cover = imread('cat2.bmp') ;    % 读取载体图像
ste_cover = cover;
ste_cover = double( ste_cover ) ;
f_id = fopen('test.txt', 'r') ;    % 读取待隐藏的文本文件，并将转换为二进制序列
[ msg, len_total] = fread( f_id, 'ubit1') ; 
[m,n] = size( ste_cover ) ;
if len_total > m* n       % 判断嵌入消息量是否过大
    error( '嵌入消息量过大, 请更换图像') ;
end
p = 1;           % p 作为消息嵌入位数计数器
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
imwrite( ste_cover,'gen_lsb.bmp') ;  % 生成隐藏信息的图像，并进行存储
subplot(2,2,1); imshow( cover); title('原始图像') ;     % 显示实验结果
subplot(2,2,2); imhist( cover); title('原始图像直方图') ;
subplot(2,2,3);imshow( ste_cover); title('隐藏信息的图像') ;
subplot(2,2,4);imhist( ste_cover); title('隐藏信息图像直方图') ;
