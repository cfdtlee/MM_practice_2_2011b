load xy.txt;
load access.txt;
load police.txt;
ljb=zeros(582);
for i=1:928 %生成邻接表
    ljb(access(i,1),access(i,2))=sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2);
end 
ljb_a=ljb(1:92,1:92);%获取A区邻接表

a=ljb_a;
a=a+a';
a(find(a==0))=inf;
n=92;
for i=1:92
   a(i,i)=0; 
end
path=zeros(n); 
for k=1:n 
   for i=1:n
      for j=1:n 
         if a(i,j)>a(i,k)+a(k,j) 
            a(i,j)=a(i,k)+a(k,j);  
            path(i,j)=k; 
         end 
      end  
   end 
end  

save ljb_a.txt -ascii ljb_a