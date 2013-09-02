
atemp=a2(475:582,475:582);
afcstemp=afcs(475:582);
pingtaishu=11;
lukoushu=108;
col=35;


%建立初始解，都找最近的平台
jiapingtai=[44 17 35 51 100];%添加的平台
pingtai=[1:pingtaishu,jiapingtai];
[M,pingtaishu]=size(pingtai);
jianshi2=ones(1,lukoushu);%添加平台后的监视方案
for i=1:lukoushu
   jianshi2(i)=pingtai(1);%假设与第一个警察局最近
   for j=1:pingtaishu %对于第i个没警察局的点，寻找最近的警察局
       if(atemp(jianshi2(i),i)>atemp(pingtai(j),i))
           jianshi2(i)=pingtai(j);
       end
   end
end
multijpt0=zeros(pingtaishu,col);%初始解，都找最近的平台
for i=1:lukoushu
    [j,k]=find(pingtai==jianshi2(i));
    [M,N]=size(find(multijpt0(k,:)~=0));
    multijpt0(k,N+1)=i;
end


e=0.1^30;L=20000000;at=0.999;T=1;
multi01=zeros(pingtaishu,col);
multi00=zeros(pingtaishu,col);
multi01=multijpt0;%multi01为新生成的安排方式
multi00=multijpt0;
gzltemp=zeros(1,pingtaishu);
for i=1:pingtaishu %求工作量
    for j=1:col
        if(multi00(i,j)~=0)
            gzltemp(i)=gzltemp(i)+atemp(pingtai(i),multi00(i,j))*afcstemp(multi00(i,j));
        end
    end
end
gzltemp=gzltemp*0.1;
fc0=var(gzltemp);%求出初始方差记为fc0


%get multi_temp2 & multi2
%duopingtshu=55;
%multi_temp2=zeros(1,duopingtshu);
clear multi_temp2;
jilupingtaishu=zeros(1,lukoushu);%计算每个点的可用平台数
for ii=1:lukoushu
    for kk=1:pingtaishu
        if(atemp(pingtai(kk),ii)<30)
            jilupingtaishu(ii)=jilupingtaishu(ii)+1;
        end
    end
end
jj=1;
for ii=1:lukoushu
    [M,N]=size(find(pingtai==ii));%N为0时 表示ii不是平台
    if(~N && jilupingtaishu(ii)>1)%不是平台而且可用平台数大于1则记录
        multi_temp2(jj)=ii;
        jj=jj+1;
    end
end

[temp,duopingtaishu]=size(multi_temp2);
multi2=zeros(duopingtaishu,col);
for ii=1:duopingtaishu %38
    for jj=1:pingtaishu %8
        if(atemp(multi_temp2(ii),pingtai(jj))<30)%如果ii点离pingtai(jj)距离小于30，把pingtai(jj)加进来
            [M,N]=size(find(multi2(ii,:)));
            multi2(ii,N+1)=pingtai(jj);
        end
    end
end


%退火过程
for k=1:L
    if rand>0.5 %换一个
    
    index=ceil(rand*duopingtaishu);%第index个城市
    sign=multi_temp2(index);%城市编号
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%在原位置去掉那个城市
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%to为随机找个可以管的警察局行丢过去~（不够好，未排除原来的
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N表示该行的数据个数
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    index=ceil(rand*duopingtaishu);%第index个城市
    sign=multi_temp2(index);%城市编号
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%在原位置去掉那个城市
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%to为随机找个可以管的警察局行丢过去~（不够好，未排除原来的
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N表示该行的数据个数
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    
    else %换两个
    
        index=ceil(rand*duopingtaishu);%第index个城市
    sign=multi_temp2(index);%城市编号
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%在原位置去掉那个城市
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%to为随机找个可以管的警察局行丢过去~（不够好，未排除原来的
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N表示该行的数据个数
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
        
    index=ceil(rand*duopingtaishu);%第index个城市
    sign=multi_temp2(index);%城市编号
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%在原位置去掉那个城市
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%to为随机找个可以管的警察局行丢过去~（不够好，未排除原来的
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N表示该行的数据个数
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    index=ceil(rand*duopingtaishu);%第index个城市
    sign=multi_temp2(index);%城市编号
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%在原位置去掉那个城市
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%to为随机找个可以管的警察局行丢过去~（不够好，未排除原来的
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N表示该行的数据个数
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    end
    
    gzltemp=zeros(1,pingtaishu);
    for i=1:pingtaishu %求工作量
        for j=1:col
            if(multi01(i,j)~=0)
                gzltemp(i)=gzltemp(i)+atemp(pingtai(i),multi01(i,j))*afcstemp(multi01(i,j));
            end
        end
    end
    gzltemp=gzltemp*0.1;
    fc1=var(gzltemp);%求出新方差记为fc1

        
    if(fc1<fc0)%新方差较小，接受新结果
        multi00=multi01;
        fc0=fc1
    elseif(exp((fc0-fc1)/T)>rand)
        multi00=multi01;
        fc0=fc1;
    end

    T=T*at;
    if T<e
        break;
    end
end
sum(gzltemp)
sum(gzltemp)/pingtaishu

