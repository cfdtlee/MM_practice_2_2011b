%11.5230  12.2744  12.1605 12.6913 11.4152!! 11.8760 12.1514
load multi0.txt;
col=20;
pingtaishu=20;
%{
multi0=[
1,68,69,71,73,74,75,76,78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
2,39,44,72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
3,54,55,65,66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
4,57,60,62,63,64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
5,49,53,56,58,59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
6,50,51,52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
7,30,48,61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
8,33,46,32,47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
9,31,34,35,45,36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
11,26,27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
12,25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
13,21,22,23,24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
15,28,29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
16,37,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
17,41,42,40,43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
18,80,81,82,83,84,85,88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
19,77,70,67,79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
20,86,87,89,90,91,92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
%}

multi01=zeros(pingtaishu,col);
multi00=zeros(pingtaishu,col);
multi01=multi0;%multi01Ϊ�����ɵİ��ŷ�ʽ
multi00=multi0;

e=0.1^30;L=20000000;at=0.9999;T=1;
gzltemp=zeros(1,pingtaishu);
        for i=1:pingtaishu %������
            for j=1:col
                if(multi00(i,j)~=0)
                    gzltemp(i)=gzltemp(i)+a(i,multi00(i,j))*afcs(multi00(i,j));
                end
            end
        end
gzltemp=gzltemp*0.1;
fc0=var(gzltemp);%�����ʼ�����Ϊfc0

%�˻����
for k=1:L
    if rand>0.5 %��һ��
    index=ceil(rand*49);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    index=ceil(rand*49);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    
    for jj=1:col
        if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
            N=jj;
        end
    end
    multi01(to,N+1)=sign;
    
    
    else %������
        index=ceil(rand*49);%��index������
        sign=multi_temp2(index);%���б��
        [M,N]=find(multi01==sign);
        multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
        %multi01(i,j:col)=[multi01(i,j+1:col),0];
        for kk=1:col
            if(multi2(index,kk)~=0)
                N=kk;
            end
        end
        to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    
        for jj=1:col
            if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
                N=jj;
            end
        end
        multi01(to,N+1)=sign;
 
        index=ceil(rand*49);%��index������
        sign=multi_temp2(index);%���б��
        [M,N]=find(multi01==sign);
        multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
        %multi01(i,j:col)=[multi01(i,j+1:col),0];
        for kk=1:col
            if(multi2(index,kk)~=0)
                N=kk;
            end
        end
        to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    
        for jj=1:col
            if(multi01(to,jj)~=0)%N��ʾ���е����ݸ���
                N=jj;
            end
        end
        multi01(to,N+1)=sign;
        
        index=ceil(rand*49);%��index������
    sign=multi_temp2(index);%���б��
    [M,N]=find(multi01==sign);
    multi01(M,N:col)=[multi01(M,N+1:col),0];%��ԭλ��ȥ���Ǹ�����
    %multi01(i,j:col)=[multi01(i,j+1:col),0];
    for kk=1:col
       if(multi2(index,kk)~=0)
           N=kk;
       end
    end
    to=multi2(index,ceil(rand*N));%toΪ����Ҹ����Թܵľ�����ж���ȥ~�������ã�δ�ų�ԭ����
    
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
                gzltemp(i)=gzltemp(i)+a(i,multi01(i,j))*afcs(multi01(i,j));
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

