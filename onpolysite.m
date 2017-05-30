function flags = onpolysite(p,poly)
if ~(poly(1,1) == poly(end,1)&&poly(1,2) ==poly(end,2))
    poly = [poly;poly(1,:)];
end
polyn = size(poly,1);
coefficient=[];
t = find(poly(:,1)==p(1)& poly(:,2)==p(2),1);
if ~isempty(t)
    flags = 1;
    return;
end 
    for j=2:polyn
        coefficient=[coefficient;getABC(poly(j-1,:),poly(j,:))];        
        if coefficient(j-1,1)*p(1)+coefficient(j-1,2)*p(2)+coefficient(j-1,3)==0
            flags=1
            return
        end
    end
flags=0;
end