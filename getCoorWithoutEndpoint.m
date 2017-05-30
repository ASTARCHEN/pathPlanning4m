function [x,y] = getCoorWithoutEndpoint(p1,p2,p3,p4)
% 求p1,p2所构成的线段与p3,p4所构成的线段忽略端点的交点
% 其中
% x,y为空矩阵，代表线段无交点
% x,y为nan，代表线段无数交点
% 如果为其他，那么x,y表示交点坐标
% 注意，p1,p2,p3,p4交点的时候忽略端点
% 如：
% [x,y] = getCoorWithoutEndpoint([0,0],[0,1],[0,0],[1,0])
% 
% x =
% 
%      []
% 
% y =
% 
%      []
%
% >> [x,y] = getCoorWithoutEndpoint([0,0],[0,1],[0.5,0.5],[1,0])
% 
% x =
% 
%      []
% 
% 
% y =
% 
%      []
% 
% See also getCoor getABC jiaodian
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

line1 = getABC(p1,p2);
line2 = getABC(p3,p4);
[x,y] = jiaodian(line1,line2);
if ~(isnan(x) && isnan(y))
    [a,b,c] = getABC(p3,p4);
    if a*p1(1) + b*p1(2) + c == 0
        x = [];
        y = [];
        return
    end
    if a*p2(1) + b*p2(2) + c == 0
       x = [];
       y = [];
       return
    end
    [a2,b2,c2] = getABC(p1,p2);
    
    if a2*p3(1) + b2*p3(2) + c2 == 0
        x = [];
        y = [];
        return
    end
    if a2*p4(1) + b2*p4(2) + c2 == 0
        x = [];
        y = [];
        return
    end
    
    if (x - p1(1))*(x - p2(1))<=eps && (y - p1(2))*(y - p2(2))<=eps && (x - p3(1))*(x - p4(1))<=eps && (y - p3(2))*(y - p4(2))<=eps
        return%%说明是内交
    else
        x = [];
        y = [];
    end
end
end