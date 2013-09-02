hold on
axis equal
for i=1:928 %画线段
    %if ( access(i,1)<=92  && access(i,2)<=92) 
        plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],':','color','g')
    %end    %end
end

%{
for i=1:928 %画线段
    if( access(i,1)<=562 && access(i,2)<=562 && access(i,1)>=475 && access(i,2)>=475 )
        plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
    end    %end
end         
for i=1:928 %画线段
    if( access(i,1)<=371 && access(i,2)<=371 && access(i,1)>=168 && access(i,2)>=168 )
        plot([xy(access(i,1),1),xy(access(i,2),1)],[xy(access(i,1),2),xy(access(i,2),2)],'color','g')
    end    %end
end       

for i=1:582 %每个十字路口画点
    plot(xy(i,1),xy(i,2),'.');
    %text(xy(i,1),xy(i,2),int2str(i));
end
%}

for i=1:582 %每个十字路口画点
    if(a2(i,32)<90)
        plot(xy(i,1),xy(i,2),'.');
    end
end

for i=1:24 %警察局所在位置
   plot(xy(fengdufangan(1,i),1),xy(fengdufangan(1,i),2),'gs','MarkerFaceColor','g');
   text(xy(fengdufangan(1,i),1),xy(fengdufangan(1,i),2),int2str(fengdufangan(1,i)));
end
plot(xy(32,1),xy(32,2),'ro','MarkerFaceColor','r');

for i=1:24 %封堵点
    plot(xy(fengdufangan(2,i),1),xy(fengdufangan(2,i),2),'r*','MarkerFaceColor','r','MarkerSize',10);
    text(xy(fengdufangan(2,i),1),xy(fengdufangan(2,i),2),int2str(fengdufangan(2,i)));
end

legend('dd');

%for i=1:582 %每个十字路口画点
%    if(a2(i,32)>60)
%        plot(xy(i,1),xy(i,2),'ro','MarkerFaceColor','g');
%    end
%end
