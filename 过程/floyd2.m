load xy.txt;
load access.txt;
load police.txt;
ljb=zeros(582);
for i=1:928 %生成邻接表
    ljb(access(i,1),access(i,2))=sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2);
end 


a2=ljb;
a2=a2+a2';
a2(find(a2==0))=inf;
n=582;
for i=1:n
   a2(i,i)=0; 
end
path=zeros(n); 
for k=1:n 
   for i=1:n
      for j=1:n 
         if a2(i,j)>a2(i,k)+a2(k,j) 
            a2(i,j)=a2(i,k)+a2(k,j);  
            path(i,j)=k; 
         end 
      end  
   end 
end  

