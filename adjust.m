function newPoint = adjust(p,poly)
if poly(1,:) ~= poly(end,:)
    poly = [poly;poly(1,:)];
end
polyn = size(poly,1);
coefficient=[];
    for j=2:polyn
        coefficient=[coefficient;getABC(poly(j-1,:),poly(j,:))];
        d(j-1)=abs((coefficient(j-1,1)*p(1)+coefficient(j-1,2)*p(2)+coefficient(j-1,3))/sqrt(...
                    coefficient(j-1,1)*coefficient(j-1,1)+coefficient(j-1,2)*coefficient(j-1,2)));
    end
    [~,index]=min(d);
    lineone=coefficient(index,:);
    if lineone(1)==0
       newPoint=[p(1),-lineone(3)/lineone(2)];
    elseif lineone(2)==0
       newPoint=[-lineone(3)/lineone(1),p(2)];
    else
       linetwo=[lineone(2)/lineone(1),-1,p(2)-lineone(2)*p(1)/lineone(1)];
       [x,y]=jiaodian(lineone,linetwo);
       newPoint=[x,y];
    end
end
    
    
    
    
    
        
        