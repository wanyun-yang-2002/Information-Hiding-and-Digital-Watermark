% DCT信息提取算法
% data0=imread('E:\xiyou\实验4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\lenadct_MEDIAN_9.bmp');
data=double( data0) /255;
% 分块做DCT 变s换
T = dctmtx(8) ;
DCTIM=blkproc(data,[ 8 8], 'P1* x* P2', T, T') ;
% 产生随机的块选择, 确定图像块的首地址
[ row, col] = size( DCTIM) ;
row = floor ( row/8) ;
col = floor( col /8) ;
a = zeros( [ row col] ) ;
msg='DCTrecover.txt';  %存储提取信息的文件
count=27*8;    %注意：请一定根据秘密信息的长短设定此处值，否则提取必定失败！
[ k1, k2] = randinterval( a, count,12) ;
for i = 1:count
	k1( 1, i) = ( k1 ( 1, i) - 1) * 8 + 1 ;
	k2( 1, i) = ( k2 ( 1, i) - 1) * 8 + 1 ;
end
%  准备提取并回写信息
frr = fopen( msg, 'w+') ;
for i = 1:count
    if DCTIM(k1(i)+4,k2(i)+1)<=DCTIM(k1(i)+3,k2(i)+2)
       fwrite( frr, 0,'ubit1') ;
    else
       fwrite( frr, 1, 'ubit1') ;
    end
end
fclose( frr) ;
