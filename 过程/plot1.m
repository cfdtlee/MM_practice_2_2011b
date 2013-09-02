hold on

for i=1:928 %画线段
    if(access(i,1)<=92 && access(i,2)<=92)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
            plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
            %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        end
    end
end

for i=1:92 %每个十字路口画点
    plot(xy(i,1),xy(i,2),'.');
    text(xy(i,1),xy(i,2),int2str(i));
end

for i=1:20 %警察局所在位置
   plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','r');
end
