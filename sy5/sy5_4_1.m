% 扩频水印提取算法（有两种提取方式，试着比较提取结果的异同。）
% 用私钥方法提取
s=zeros(len_total,1);
for j=1:len_total
    s(j,1)=0;
    for i=(j-1)*k1+1:j*k1
        s(j,1)=s(j,1)+(double(bitand(ste_cover(i),1))*2-1)*B(i,1);
    end
    s(j,1)=s(j,1)/k1;
end

%最终显示恢复的二值图！
www=zeros(r,t);
imtool(www);
www=logical(www);
imtool(www);
for i=1:len_total
    if s(i,1)==1
        www(i)=1;
    else
        www(i)=0;
    end
end
imtool(www);