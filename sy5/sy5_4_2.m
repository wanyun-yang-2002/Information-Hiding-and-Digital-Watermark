% ��Ƶˮӡ��ȡ�㷨
% �ù�Կ������ȡ
s=zeros(len_total,1);
for j=1:len_total
    s(j,1)=0;
    for i=(j-1)*k1+1:j*k1
        s(j,1)=s(j,1)+(double(bitand(ste_cover(i),1))*2-1)*BB(i,1);
    end
    s(j,1)=(s(j,1)*N)/k1;
end

%������ʾ�ָ��Ķ�ֵͼ��
www=zeros(r,t);
www=logical(www);
for i=1:len_total
    if s(i,1)==1
        www(i)=1;
    else
        www(i)=0;
    end
end
imtool(www);

