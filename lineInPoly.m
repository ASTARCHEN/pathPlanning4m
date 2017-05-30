function flag = lineInPoly(p,q,poly)
% �ж��߶��Ƿ��ڶ������
% p��q�ֱ���1*2���󣬱�ʾ�߶ε������˵�
% poly Ϊ����ξ���
% ��flag = 1�����߶��ڶ������,0��ʾ����
% See also inPoly
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30
flag = 0;
if (~inPoly(p,poly) || ~inPoly(q,poly))
    flag = 0;
    return
end
pointSet = [];
poly = getPoly(poly);
len_points = size(poly,1);
for i = 1:(len_points-1)
    s1 = poly(i,:);
    s2 = poly(i+1,:);
    [a,b,c] = getABC(s1,s2);
    if a*p(1) + b*p(2) + c == 0
        pointSet = [pointSet;p];
    end
    if a*q(1) + b*q(2) + c == 0
        pointSet = [pointSet;q];
    end
    [a2,b2,c2] = getABC(p,q);
    
    if a2*s1(1) + b2*s1(2) + c2 == 0
        pointSet = [pointSet;s1];
    end
    if a2*s2(1) + b2*s2(2) + c2 == 0
        pointSet = [pointSet;s2];
    end
    
     [x,y] = getCoorWithoutEndpoint(p,q,s1,s2);
%     [x,y] = getCoor(p,q,s1,s2);

    if ~isempty(x) && ~isempty(y)%%���ڽ������߶�һ�����ڶ������
%         if isnan(x) && isnan(y)
%             continue
%         else
            flag = 0;        
            return
%         end
    end
end

if isempty(pointSet)
    return
end
pointSet = unique(pointSet,'rows');%%ȥ����ͬ�ĵ㣬��������߶ζ˵��ཻ������������ͬ�Ľ���
len_set = size(pointSet,1);
if len_set == 1
    flag = 1;
    return
end
[~,Idx] = sort(pointSet(:,2));
pointSet = pointSet(Idx,:);
[~,Idx] = sort(pointSet(:,1));
pointSet = pointSet(Idx,:);
for i = 1 : (len_set-1)
    if ~inPoly([mean([pointSet(i,1),pointSet(i+1,1)]),mean([pointSet(i,2),pointSet(i+1,2)])],poly)     
        flag = 0;
        return
    end
end
flag = 1;
end