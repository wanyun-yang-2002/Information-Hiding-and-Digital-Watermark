% LSB提取算法
% ste_cover = imread('gen_lsb.bmp') ;
% ste_cover = imread('E:\xiyou\实验4-6\StirMarkBenchmark_4_0_129\Media\Output\Images\Set1\cat_lsb_PSNR_40.bmp') ;
ste_cover = double( ste_cover ) ;
[m,n] = size(ste_cover) ;
len_total=m*n;         % 若知道隐藏信息的长度，可在此处直接将其赋给len_total
frr = fopen('recover.txt', 'w+') ;
p = 1;                % p 作为消息嵌入位数计数器, 将消息序列写回文本文件
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
