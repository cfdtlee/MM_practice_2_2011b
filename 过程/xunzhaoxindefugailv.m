atemp=a2(372:474,372:474);
afcstemp=afcs(372:474);
pingtaishu=15;
lukoushu=103;
col=35;

jiapingtai=[17 21 40 47 31];%��ӵ�ƽ̨
pingtai=[1:pingtaishu,jiapingtai];
[M,pingtaishu]=size(pingtai);

dutym=zeros(103);
for i=1:pingtaishu %����ƽ̨
    for j=1:103 %����·��
        %[temp,ii]=find(pingtai==i-474);
        ii=pingtai(i);
        if(atemp(ii,j)<30)
            dutym(ii,j)=1;
        end
    end
end

inneed=find(sum(dutym)==0);%Ѱ��û����ܵĵ㣬��������inneed��¼
[m,n]=size(inneed)
