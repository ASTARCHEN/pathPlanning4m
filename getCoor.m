function [x,y] = getCoor(p1,p2,p3,p4)
% 求p1,p2所构成的线段与p3,p4所构成的线段的交点
% 其中
% x,y为空矩阵，代表线段无交点
% x,y为nan，代表线段平行
% 如果为其他，那么x,y表示交点坐标
% See also getCoorWithoutEndpoint getABC jiaodian
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

line1 = getABC(p1,p2);
line2 = getABC(p3,p4);
[x,y] = jiaodian(line1,line2);
if ~(isnan(x) && isnan(y))
    if (x - p1(1))*(x - p2(1))<=0 && (y - p1(2))*(y - p2(2))<=0 && (x - p3(1))*(x - p4(1))<=0 && (y - p3(2))*(y - p4(2))<=0
        return
    else
        x = [];
        y = [];
    end
else
    return;
end
end