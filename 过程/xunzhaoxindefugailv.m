atemp=a2(372:474,372:474);
afcstemp=afcs(372:474);
pingtaishu=15;
lukoushu=103;
col=35;

jiapingtai=[17 21 40 47 31];%添加的平台
pingtai=[1:pingtaishu,jiapingtai];
[M,pingtaishu]=size(pingtai);

dutym=zeros(103);
for i=1:pingtaishu %遍历平台
    for j=1:103 %遍历路口
        %[temp,ii]=find(pingtai==i-474);
        ii=pingtai(i);
        if(atemp(ii,j)<30)
            dutym(ii,j)=1;
        end
    end
end

inneed=find(sum(dutym)==0);%寻找没警察管的点，用行向量inneed记录
[m,n]=size(inneed)
