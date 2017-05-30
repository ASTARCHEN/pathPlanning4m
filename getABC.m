function [a,b,c] = getABC(p1,p2)
% 通过两点确定直线的标准方程a*x+b*y+c=0
% p1，p2 1*2 double 表示点
% 若返回值是矩阵，那么矩阵为1*3 double,表示a,b,c三个值
% 若返回值是三个数，其分别表示a,b,c三个值
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

    a = p2(2) - p1(2);
    b = p1(1) - p2(1);
    c = -a * p1(1) - b * p1(2);
    if nargout == 1
        a = [a,b,c];
        return
    end
end