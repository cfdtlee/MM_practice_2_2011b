load police.txt;
t=5.97375;%3分钟内抓到
ljbtemp=ljb+ljb';
weidaoda=ones(1,582);%逃犯经过记为0，未经过记为1
for i=1:582 %计算3+t逃犯跑到过的点
    if(a2(i,32)<=(3+t)*10)
        weidaoda(i)=0;
    end
end
clear jingguolukou;
clear nahang;
clear fengsuolukou;
jingguolukou=find(weidaoda==0);%jingguolukou(i)为路口编号
[temp,m]=size(jingguolukou);%m为逃犯经过的路口数

%从邻接表jingguolukou(m)那行寻找不为0的值的列数为m路口相邻的路口，
%如果这个路口的weidaoda()值为1则为封锁路口，记录
k=1;
for i=1:m
    nahang=ljbtemp(jingguolukou(i),:);
    for j=1:582
        if(nahang(j)~=0 && weidaoda(j)==1)
            fengsuolukou(k)=j;
            weidaoda(j)=0;
            k=k+1;
        end
    end
end
%fengsuolukou=sort(fengsuolukou);
[temp,n]=size(fengsuolukou)

 %计算n个封锁路口和80个平台的距离矩阵
costtemp=a2(police,fengsuolukou);
[M,N]=munkres(costtemp);
zuidashijian=0;
kk=1;
for i=1:80
    if (M(i)~=0)
        %if(zuidashijian<a2(police(i),fengsuolukou(M(i))))
        %    zuidashijian=a2(police(i),fengsuolukou(M(i)));
        %end
        zuidashijian(kk)=a2(police(i),fengsuolukou(M(i)));
        
        fengdufangan(1,kk)=police(i);
        fengdufangan(2,kk)=fengsuolukou(M(i));
        kk=kk+1;
        %画出平台
        %plot(xy(police(i),1),xy(police(i),2),'ro','MarkerFaceColor','r');
        %text(xy(police(i),1),xy(police(i),2),int2str(police(i)));
        
    end
end


%案发地点到封锁路口的距离
anfadaofengsuo=a2(32,fengsuolukou);
gedianweibu=anfadaofengsuo-zuidashijian-30;

