
atemp=a2(475:582,475:582);
afcstemp=afcs(475:582);
pingtaishu=11;
lukoushu=108;
col=35;


%������ʼ�⣬���������ƽ̨
jiapingtai=[44 17 35 51 100];%��ӵ�ƽ̨
pingtai=[1:pingtaishu,jiapingtai];
[M,pingtaishu]=size(pingtai);
jianshi2=ones(1,lukoushu);%���ƽ̨��ļ��ӷ���
for i=1:lukoushu
   jianshi2(i)=pingtai(1);%�������һ����������
   for j=1:pingtaishu %���ڵ�i��û����ֵĵ㣬Ѱ������ľ����
       if(atemp(jianshi2(i),i)>atemp(pingtai(j),i))
           jianshi2(i)=pingtai(j);
       end
   end
end
multijpt0=zeros(pingtaishu,col);%��ʼ�⣬���������ƽ̨
for i=1:lukoushu
    [j,k]=find(pingtai==jianshi2(i));
    [M,N]=size(find(multijpt0(k,:)~=0));
    multijpt0(k,N+1)=i;
end


e=0.1^30;L=20000000;at=0.999;T=1;
multi01=zeros(pingtaishu,col);
multi00=zeros(pingtaishu,col);
multi01=multijpt0;%multi01Ϊ�����ɵİ��ŷ�ʽ
multi00=multijpt0;
gzltemp=zeros(1,pingtaishu);
for i=1:pingtaishu %������
    for j=1:col
        if(multi00(i,j)~=0)
            gzltemp(i)=gzltemp(i)+atemp(pingtai(i),multi00(i,j))*afcstemp(multi00(i,j));
        end
    end
end
gzltemp=gzltemp*0.1;
fc0=var(gzltemp);%�����ʼ�����Ϊfc0


%get multi_temp2 & multi2
%duopingtshu=55;
%multi_temp2=zeros(1,duopingtshu);
clear multi_temp2;
jilupingtaishu=zeros(1,lukoushu);%����ÿ����Ŀ���ƽ̨��
for ii=1:lukoushu
    for kk=1:pingtaishu
        if(atemp(pingtai(kk),ii)<30)
            jilupingtaishu(ii)=jilupingtaishu(ii)+1;
        end
    end
end
jj=1;
for ii=1:lukoushu
    [M,N]=size(find(pingtai==ii));%NΪ0ʱ ��ʾii����ƽ̨
    if(~N && jilupingtaishu(ii)>1)%����ƽ̨���ҿ���ƽ̨������1���¼
        multi_temp2(jj)=ii;
        jj=jj+1;
    end
end

[temp,duopingtaishu]=size(multi_temp2);
multi2=zeros(duopingtaishu,col);
for ii=1:duopingtaishu %38
    for jj=1:pingtaishu %8
        if(atemp(multi_temp2(ii),pingtai(jj))<30)%���ii����pingtai(jj)����С��30����pingtai(jj)�ӽ���
            [M,N]=size(find(multi2(ii,:)));
            multi2(ii,N+1)=pingtai(jj);
        end
    end
end


%�˻����
for k=1:L
    if rand>0.5 %��һ��
    
    index=ceil(rand*duopingtaishu);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    index=ceil(rand*duopingtaishu);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    
    else %������
    
        index=ceil(rand*duopingtaishu);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
        
    index=ceil(rand*duopingtaishu);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    index=ceil(rand*duopingtaishu);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    %to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    [temp,to]=find(pingtai==multi2(index,ceil(rand*N)));
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    end
    
    gzltemp=zeros(1,pingtaishu);
    for i=1:pingtaishu %������
        for j=1:col
            if(multi01(i,j)~=0)
                gzltemp(i)=gzltemp(i)+atemp(pingtai(i),multi01(i,j))*afcstemp(multi01(i,j));
            end
        end
    end
    gzltemp=gzltemp*0.1;
    fc1=var(gzltemp);%����·����Ϊfc1

        
    if(fc1<fc0)%�·����С�������½��
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

