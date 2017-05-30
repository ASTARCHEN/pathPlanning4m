function flag = access(startPoint, endPoint, tabu)%%起终点不一定是真正意义上的起终点，返回值为0时不可达
% 判断startPoint, endPoint组成的线段是否与tabu构成的障碍物多边形的边相交
% startPoint 1*2 double表示起点
% endPoint 1*2 double 表示终点
% tabu pn*2 double 表示障碍物多边形，每个点顺次连接组成的多边形，可以为凸多边形，也可以为凹多边形，但是不能有"洞"。tabu(1,:)应该与tabu(end,:)相同。（若不同，程序自动调整为相同)
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

    obj = tabu;
    obj = getPoly(obj);
    len_lines = size(obj,1);
     for j = 1 : (len_lines)
%          if startPoint==obj(j,:)||endPoint==obj(j,:)%%精度原因，出现错误
          if sum(abs(startPoint-obj(j,:)))<eps || sum(abs(endPoint-obj(j,:)))<eps%%表示两点相等
             continue;              
          else   
             if collineation(startPoint, endPoint,obj(j,:)) && sum((endPoint-startPoint)./(obj(j,:)-endPoint))<0 &&...
                     ~(startPoint(1)>=min(obj(j,1),endPoint(1)) && startPoint(2)>=min(obj(j,2),endPoint(2)) && ...
                     startPoint(1)<=max(obj(j,1),endPoint(1)) && startPoint(2)<=max(obj(j,2),endPoint(2)))
                 flag = 0;
                 return
             end
         end
     end
    for j = 1 : (len_lines-1)
        [x,y] = getCoorWithoutEndpoint(startPoint,endPoint,obj(j,:),obj(j+1,:));
        if ~((isempty(x) && isempty(y)) || (isnan(x) && isnan(y)))
            flag = 0;
            return            
        end
    end
flag = 1;
end