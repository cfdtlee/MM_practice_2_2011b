hold on

for i=1:928 %画线段
    %if(access(i,1)<=92 && access(i,2)<=92)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        %if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
        %    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
        %    %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        %end
end

for i=1:582 %每个十字路口画点
    plot(xy(i,1),xy(i,2),'.');
    %text(xy(i,1),xy(i,2),int2str(i));
end

%for i=1:80 %警察局所在位置
%   plot(xy(police(i),1),xy(police(i),2),'ro','MarkerFaceColor','r');
%end
plot(xy(32,1),xy(32,2),'ro','MarkerFaceColor','r');

for i=1:582 %每个十字路口画点
    if(a2(i,32)>60)
        plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','g');
    end
end

%{
画E
hold on
for i=1:928 %画线段
    if(372<=access(i,1) && access(i,1)<=474 && 372<=access(i,2) &&access(i,2)<=474)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        %if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
        %    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
        %    %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        %end
    end
end
jj=1;
for i=372:474 %每个十字路口画点
    
    plot(xy(i,1),xy(i,2),'.');
    text(xy(i,1),xy(i,2),int2str(jj));
    jj=jj+1;
    if jj<16
        plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','r');
    end
end
for i=1:32 %不可达
    plot(xy(inneed(i)+371,1),xy(inneed(i)+371,2),'ro','MarkerFaceColor','g');
end
%}
%{
画C 
hold on
for i=1:928 %画线段
    if(166<=access(i,1) && access(i,1)<=319 && 166<=access(i,2) &&access(i,2)<=319)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        %if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
        %    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
        %    %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        %end
    end
end
jj=1;
for i=166:319 %每个十字路口画点
    
    plot(xy(i,1),xy(i,2),'.');
    text(xy(i,1),xy(i,2),int2str(jj));
    jj=jj+1;
    if jj<17 %平台数
        plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','r');
    end
end
for i=1:47 %不可达
    plot(xy(inneed(i)+165,1),xy(inneed(i)+165,2),'ro','MarkerFaceColor','g');
end
%}
%{
画F 需改duty2中数据获得inneed
hold on
for i=1:928 %画线段
    if(475<=access(i,1) && access(i,1)<=582 && 475<=access(i,2) &&access(i,2)<=582)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        %if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
        %    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
        %    %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        %end
    end
end
jj=1;
for i=475:582 %每个十字路口画点
    
    plot(xy(i,1),xy(i,2),'.');
    text(xy(i,1),xy(i,2),int2str(jj));
    jj=jj+1;
    if jj<17 %平台数
        plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','r');
    end
end
for i=1:35 %不可达
    plot(xy(inneed(i)+474,1),xy(inneed(i)+474,2),'ro','MarkerFaceColor','g');
end
%}