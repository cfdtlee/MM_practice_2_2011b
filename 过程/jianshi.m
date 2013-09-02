%全部找最近的警察局用矩阵jianshi存储

jianshi=ones(1,92);
for i=1:92 
   jianshi(i)=1;%假设与第一个警察局最近
   for j=1:20 %对于第i个没警察局的点，寻找最近的警察局
       if(a(jianshi(i),i)>a(j,i))
           jianshi(i)=j;
       end
   end
end
multi0=zeros(20,10);
for i=1:92
    [M,N]=size(find(multi0(jianshi(i),:)~=0));
    multi0(jianshi(i),N+1)=i;
end


%{
enter=[
12
14
16
21
22
23
24
28
29
30
38
48
62
];
for i=1:20
    for j=1:13
        police_cross(i,j)=a(i,enter(j));
    end
end
%}