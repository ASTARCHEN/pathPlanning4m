function [x,y] = jiaodian(line1,line2)
% 求两直线line1与line2的交点
% 其中line1,line2为直线的标准形式ax+by+c=0
% x,y为nan，代表线段平行
% 如果为其他，那么x,y表示交点坐标
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

a1 = line1(1);
b1 = line1(2);
c1 = line1(3);
a2 = line2(1);
b2 = line2(2);
c2 = line2(3);
if a2*b1-a1*b2 == 0
    x = nan;
    y = nan;
    return
end
y = (a1*c2-c1*a2)/(a2*b1-a1*b2);
x = -(b1*c2-c1*b2)/(a2*b1-a1*b2);
end