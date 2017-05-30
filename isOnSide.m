function flag = isOnSide(poly,p1,p2)
% 判断p1,p2组成的线段是否在多边形的边上
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

poly = getPoly(poly);

v = p1 - p2;

n = size(poly,1);

for i = 1 : (n-1)
    pa = poly(i,:);
    pb = poly(i+1,:);
    if collineation(v,pa,pb) && collineation(pa-p1,pb-p2) % 四点贡献条件
         l1 = pa - p1;
         l2 = p1 - pb;
         l3 = pa - p2;
         l4 = p2 - pb;
         if l1(1) * l2(1) >= -eps && l3(1) * l4(1) >= -eps
             flag = 1;
             return
         end
    end
end
flag = 0;
end