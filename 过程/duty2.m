need=zeros(1,5);
%cross_num=[92 73 154 52 103 108];
%police_num=[20 8 17 9 15 11];
cross_num=[0 92 165 319 371 474 582];
police_num=[0 20 100 182 328 386 485];

for k=1:6
dutym2=zeros(cross_num(k+1));
for i=police_num(k)+1:police(k+1)
    for j=cross_num(k)+1:cross_num(k+1)
        if(a2(i,j)<30)
            dutym2(i,j)=1;
        end
    end
end

[M,need(k)]=size(find(sum(dutym2(police_num(k)+1:police(k+1),cross_num(k)+1:cross_num(k+1)))==0));
end

dutym=zeros(108);
for i=475:485
    for j=475:582
        if(a2(i,j)<30)
            dutym(i-474,j-474)=1;
        end
    end
end

inneed=find(sum(dutym)==0);%寻找没警察管的点，用行向量inneed记录
[m,n]=size(inneed)

 %0.9348    0.9178    0.6948    0.7692    0.6893    0.6759

%xiaoyulv=need./cross_num;
%inneed2=find(sum(dutym2)==0);%寻找没警察管的点，用行向量inneed记录