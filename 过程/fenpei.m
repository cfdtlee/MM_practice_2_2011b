function [z,ans]=fenpei(matrix)

%//////////////////////////////////////////////////
            %����Ч�ʾ��� marix Ϊ����;
            %��Ч�ʾ������� M,����һ��ִ��������;
            %���zΪ���Ž⣬ansΪ ���ŷ������
%//////////////////////////////////////////////////
atemp=matrix;
b=atemp;
%ȷ������ά��
s=length(atemp);
%ȷ����������Сֵ�������м�
ml=min(atemp');
for i=1:s
    atemp(i,:)=atemp(i,:)-ml(i);
end
%ȷ����������Сֵ�������м�
mr=min(atemp);
for j=1:s
    atemp(:,j)=atemp(:,j)-mr(j);
end
% start working
num=0;
while(num~=s)  %��ֹ�����ǡ���0�����ĸ���������ά����ͬ
    %index���Ա�Ǿ����е���Ԫ�أ���a(i,j)=0����index(i,j)=1,����index(i,j)=0
    index=ones(s);
    index=atemp&index;
    index=~index;
    %flag���Ա�ǻ���λ��flag=0 ��ʾδ�����ߣ�
    %flag=1 ��ʾ�л��߹���flag=2 ��ʾΪ��ֱ�߽���
    %ans���Լ�¼ a �С���0������λ��
    %ѭ�������³�ʼ��flag,ans
    flag = zeros(s);
    ans = zeros(s);
    %һ��ѭ������ȫ���̣���ֹ���������е���Ԫ�ؾ���ֱ�߸��ǣ�
    %����flag>0λ,index=0
    while(sum(sum(index)))
        %�����ҳ�����0��������λ�ã����ԡ���0���������л��ߣ�
        %������flag,ͬʱ�޸�index,���������ans
        for i=1:s
            t=0;
            l=0;
            for j=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    l=l+1;
                    t=j;
                end
            end
            if(l==1)
                flag(:,t)=flag(:,t)+1;
                index(:,t)=0;
                ans(i,t)=1;
            end
        end
        %�����ҳ�����0��������λ�ã����ԡ���0���������л��ߣ�
        %������flag,ͬʱ�޸�index,���������ans
        for j=1:s
            t=0;
            r=0;
            for i=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    r=r+1;
                    t=i;
                end
            end
            if(r==1)
                flag(t,:)=flag(t,:)+1;
                index(t,:)=0;
                ans(t,j)=1;
            end
        end
    end  %�� while(sum(sum(index)))
    %�������
    %������������ans��1�ĸ�������num��ʾ
    num=sum(sum(ans));
    % �ж��Ƿ������ֹ��������������ѭ��
    if(s==num)
        break;
    end
    %���򣬽�����һ������
    %ȷ��δ�����ߵ���СԪ�أ���m��ʾ
    m=max(max(atemp));
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                if(atemp(i,j)<m)
                    m=atemp(i,j);
                end
            end
        end
    end
    %δ�����ߣ���flag=0����ȥm���߽��㣬��flag=2������m
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                atemp(i,j)=atemp(i,j)-m;
            end
            if(flag(i,j)==2)
                   atemp(i,j)=atemp(i,j)+m;
            end
       end
   end
end  %��while(num~=s) 
%�������ţ�min��ֵ
zm=ans.*b;
z=0;
z=sum(sum(zm));



