dutym=zeros(92);
for i=1:20
    for j=1:92
        if(a(i,j)<30)
            dutym(i,j)=1;
        end
    end
end

inneed=find(sum(dutym)==0);%Ѱ��û����ܵĵ㣬��������inneed��¼
[m,n]=size(inneed);
inneed2=ones(m,n);
for i=1:n 
   hold on
   plot(xy(inneed(i),1),xy(inneed(i),2),'ro','MarkerFaceColor','g');
   %[t1,t2]=min(a(inneed(i)));
   %inneed2=t2;
   inneed2(i)=1;%�������һ����������
   mindis=a(i,1);
   for j=1:20 %���ڵ�i��û����ֵĵ㣬Ѱ������ľ����
       if(a(inneed2(i),inneed(i))>a(j,inneed(i)))
           inneed2(i)=j;
       end
   end
   
   %[Y,U]=max(A)%����������Y��U��Y������¼A��ÿ�е����ֵ��U������¼ÿ�����ֵ���кš�
end

onlyone(1,:)=find(sum(dutym)==1);%Ѱ��ֻ��һ������ܵĵ㣬��������onlyone��¼
onlyone(2,:)=mod(find(dutym(:,onlyone)),92)%???

multi_temp=find(sum(dutym)>1);%Ѱ���ж������ܵĵ㣬��������multi��¼
%multi(2,:)=mod(find(dutym(:,multi)),92)
multi2=zeros(49,20);
multi=multi_temp(find(multi_temp>20))'
for i=1:49
    temp=find(dutym(:,multi(i))==1);
    [m,n]=size(temp);
    multi2(i,1:m)=temp;
end


