function points = getPoly(points)
% 返回多边形的标准形式
% 即points(1,:)需要与points(end,:)相同
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30
if sum(points(1,:) == points(end,:)) ~= 2%如果两点相等，返回（1,1）
    points = [points;points(1,:)];
end
end