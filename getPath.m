function [dis,path] = getPath(startPoint, endPoint, tabu)
% 找到从起点startPoint到终点endPoint在障碍物列表tabu下的最短路径
% 其中 dis是路径长度，path是途经的点集
% 若dis为inf，表示没有从起点startPoint到终点endPoint的路径
% startPoint ：1*2 double
% endPoint ：1*2 double
% tabu : 1*m cell,每个元胞内是n*2矩阵，表示障碍物
% See also Dijkstra
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30
points = [];
len_tabu = length(tabu);
for i=1 : len_tabu
    obj = getPoly(tabu{i});
    points = [points;obj(1:(end-1),:)];
end
points = [startPoint;points;endPoint];
Y = pdist(points);%生成行向量
D=squareform(Y);%生成距离方阵
len_points = size(points,1);
for i =1:(len_points)
    for j = (i+1):(len_points)
        p1 = points(i,:);
        p2 = points(j,:); 
        for k = 1 : len_tabu         
            if ~isOnSide(tabu{k},startPoint, endPoint) && (lineInPoly(p1,p2,tabu{k})|| ~access(p1,p2,tabu{k}))
                D(i,j) = inf;
                D(j,i) = inf;
                break;
            end
        end
    end
end

[dis,pathIdx] = Dijkstra(D,1,len_points);
path = points(pathIdx,:);
end