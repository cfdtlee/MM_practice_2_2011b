dutym=zeros(92);
for i=1:20
    for j=1:92
        if(a(i,j)<30)
            dutym(i,j)=1;
        end
    end
end

inneed=find(sum(dutym)==0);%寻找没警察管的点，用行向量inneed记录
[m,n]=size(inneed);
inneed2=ones(m,n);
for i=1:n 
   hold on
   plot(xy(inneed(i),1),xy(inneed(i),2),'ro','MarkerFaceColor','g');
   %[t1,t2]=min(a(inneed(i)));
   %inneed2=t2;
   inneed2(i)=1;%假设与第一个警察局最近
   mindis=a(i,1);
   for j=1:20 %对于第i个没警察局的点，寻找最近的警察局
       if(a(inneed2(i),inneed(i))>a(j,inneed(i)))
           inneed2(i)=j;
       end
   end
   
   %[Y,U]=max(A)%返回行向量Y和U，Y向量记录A的每列的最大值，U向量记录每列最大值的行号。
end

onlyone(1,:)=find(sum(dutym)==1);%寻找只有一个警察管的点，用行向量onlyone记录
onlyone(2,:)=mod(find(dutym(:,onlyone)),92)%???

multi_temp=find(sum(dutym)>1);%寻找有多个警察管的点，用行向量multi记录
%multi(2,:)=mod(find(dutym(:,multi)),92)
multi2=zeros(49,20);
multi=multi_temp(find(multi_temp>20))'
for i=1:49
    temp=find(dutym(:,multi(i))==1);
    [m,n]=size(temp);
    multi2(i,1:m)=temp;
end


