% DCT��Ϣ��ȡ�㷨
% data0=imread('E:\xiyou\ʵ��4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\lenadct_MEDIAN_9.bmp');
data=double( data0) /255;
% �ֿ���DCT ��s��
T = dctmtx(8) ;
DCTIM=blkproc(data,[ 8 8], 'P1* x* P2', T, T') ;
% ��������Ŀ�ѡ��, ȷ��ͼ�����׵�ַ
[ row, col] = size( DCTIM) ;
row = floor ( row/8) ;
col = floor( col /8) ;
a = zeros( [ row col] ) ;
msg='DCTrecover.txt';  %�洢��ȡ��Ϣ���ļ�
count=27*8;    %ע�⣺��һ������������Ϣ�ĳ����趨�˴�ֵ��������ȡ�ض�ʧ�ܣ�
[ k1, k2] = randinterval( a, count,12) ;
for i = 1:count
	k1( 1, i) = ( k1 ( 1, i) - 1) * 8 + 1 ;
	k2( 1, i) = ( k2 ( 1, i) - 1) * 8 + 1 ;
end
%  ׼����ȡ����д��Ϣ
frr = fopen( msg, 'w+') ;
for i = 1:count
    if DCTIM(k1(i)+4,k2(i)+1)<=DCTIM(k1(i)+3,k2(i)+2)
       fwrite( frr, 0,'ubit1') ;
    else
       fwrite( frr, 1, 'ubit1') ;
    end
end
fclose( frr) ;
