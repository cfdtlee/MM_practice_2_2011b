load police.txt;
t=5.97375;%3������ץ��
ljbtemp=ljb+ljb';
weidaoda=ones(1,582);%�ӷ�������Ϊ0��δ������Ϊ1
for i=1:582 %����3+t�ӷ��ܵ����ĵ�
    if(a2(i,32)<=(3+t)*10)
        weidaoda(i)=0;
    end
end
clear jingguolukou;
clear nahang;
clear fengsuolukou;
jingguolukou=find(weidaoda==0);%jingguolukou(i)Ϊ·�ڱ��
[temp,m]=size(jingguolukou);%mΪ�ӷ�������·����

%���ڽӱ�jingguolukou(m)����Ѱ�Ҳ�Ϊ0��ֵ������Ϊm·�����ڵ�·�ڣ�
%������·�ڵ�weidaoda()ֵΪ1��Ϊ����·�ڣ���¼
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

 %����n������·�ں�80��ƽ̨�ľ������
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
        %����ƽ̨
        %plot(xy(police(i),1),xy(police(i),2),'ro','MarkerFaceColor','r');
        %text(xy(police(i),1),xy(police(i),2),int2str(police(i)));
        
    end
end


%�����ص㵽����·�ڵľ���
anfadaofengsuo=a2(32,fengsuolukou);
gedianweibu=anfadaofengsuo-zuidashijian-30;

