%ȫ��������ľ�����þ���jianshi�洢

jianshi=ones(1,92);
for i=1:92 
   jianshi(i)=1;%�������һ����������
   for j=1:20 %���ڵ�i��û����ֵĵ㣬Ѱ������ľ����
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