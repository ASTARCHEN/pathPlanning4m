function [dis,path] = getPath(startPoint, endPoint, tabu)
% �ҵ������startPoint���յ�endPoint���ϰ����б�tabu�µ����·��
% ���� dis��·�����ȣ�path��;���ĵ㼯
% ��disΪinf����ʾû�д����startPoint���յ�endPoint��·��
% startPoint ��1*2 double
% endPoint ��1*2 double
% tabu : 1*m cell,ÿ��Ԫ������n*2���󣬱�ʾ�ϰ���
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
Y = pdist(points);%����������
D=squareform(Y);%���ɾ��뷽��
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