% DCT��Ϣ�����㷨
frr = fopen('test.txt','r');
[msg,count] = fread(frr,'ubit1') ;
fclose(frr) ;
data0 = imread('lena600.bmp') ;
% ��ͼ�����תΪdouble ��
data = double(data0) /255;
% ��ͼ��ֿ�
T = dctmtx( 8) ;
% �Էֿ�ͼ����DCT �任
IMDCT=blkproc(data,[8 8 ],'P1*x*P2',T,T') ;
% ��������Ŀ�ѡ��, ȷ��ͼ�����׵�ַ
[ row, col] = size( IMDCT) ;
row = floor(row/8) ;
col = floor(col/8) ;
a = zeros( [ row col] ) ;
[k1,k2] = randinterval(a,count,12) ;  %�˴����ó���1�����ĺ����������������λ��
for i = 1:count          %����������λ��
   k1(1,i) = (k1(1,i)-1)*8+1;
   k2(1,i) = (k2(1,i)-1)*8+1;
end     
% ��ϢǶ��
temp=0;
H=0.2;   %���Ʋ�������֤Ƕ��������ȷ�ԡ�
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
     IMDCT(k1(i)+3,k2(i)+2)=IMDCT(k1(i)+3,k2(i)+2)-H; % ��Сϵ��������С
    else
        IMDCT(k1(i)+4,k2(i)+1)=IMDCT(k1(i)+4,k2(i)+1)-H;
    end
end
result = blkproc(IMDCT,[8 8],'P1*x*P2',T',T);
imwrite(result,'lenadct.bmp') ;
subplot(2,2,1); imshow(data); title('ԭʼͼ��') ;   % ��ʾʵ����
subplot(2,2,2); imhist(data); title('ԭʼͼ��ֱ��ͼ') ;
subplot(2,2,3);imshow(result); title('αװͼ��') ;
subplot(2,2,4);imhist(result); title('αװͼ��ֱ��ͼ');
