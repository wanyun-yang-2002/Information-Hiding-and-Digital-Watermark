% Patch水印提取算法
s=10;
S=0;
rand('seed',s);
C=rand(1,2*N);
D=floor(K*C)+1;
LL=0;
for k=1:N
    LL=LL+D(2*k-1);
    S=S+double(PEM(LL));
    LL=LL+D(2*k);
    S=S-double(PEM(LL));
end