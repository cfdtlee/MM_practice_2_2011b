hold on

for i=1:928 %画线段
    if(access(i,1)<=92 && access(i,2)<=92)
    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
        %if(sqrt((xy(access(i,1),1)-xy(access(i,2),1))^2+(xy(access(i,1),2)-xy(access(i,2),2))^2)>30)
        %    plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','b')
        %    %text((x(ljb(i,1))+x(ljb(i,2)))/2,(y(ljb(i,1))+y(ljb(i,2)))/2,int2str(distance(i)));%标长度
        %end
    end
end
for i=1:92 %每个十字路口画点
    plot(xy(i,1),xy(i,2),'.');
    %text(xy(i,1),xy(i,2),int2str(i));
end
bfeng=[2	4	5	7	8	9	10	11	12	13	14	15	16];
feng=[38	62	48	29	30	16	22	24	12	23	21	28	14];

for i=1:13 %警察局所在位置
   plot(xy(bfeng(i),1),xy(bfeng(i),2),'gs','MarkerFaceColor','g');
   text(xy(bfeng(i),1),xy(bfeng(i),2),int2str(bfeng(i)));
end

for i=1:13 %封堵点
    plot(xy(feng(i),1),xy(feng(i),2),'r*','MarkerFaceColor','r');
    text(xy(feng(i),1),xy(feng(i),2),int2str(feng(i)));
end

legend('dd');
