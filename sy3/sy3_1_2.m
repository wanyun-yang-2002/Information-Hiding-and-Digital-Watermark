% LSB��ȡ�㷨
% ste_cover = imread('gen_lsb.bmp') ;
% ste_cover = imread('E:\xiyou\ʵ��4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\cat_lsb_PSNR_40.bmp') ;
ste_cover = double( ste_cover ) ;
[m,n] = size(ste_cover) ;
len_total=m*n;         % ��֪��������Ϣ�ĳ��ȣ����ڴ˴�ֱ�ӽ��丳��len_total
frr = fopen('recover.txt', 'w+') ;
p = 1;                % p ��Ϊ��ϢǶ��λ��������, ����Ϣ����д���ı��ļ�
for f2 = 1:n
    for f1 = 1:m
        if bitand( ste_cover( f1, f2) , 1) == 1
            fwrite( frr, 1, 'ubit1') ;
        else
            fwrite( frr, 0, 'ubit1') ;
        end
        if p==len_total
            break;
        end
	p = p + 1;
    end
	if p==len_total
        break;
	end
end
fclose( frr) ;
