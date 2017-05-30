function flag = collineation(p1,p2,p3,p4)
% 判断点是否共线
% 若输入为2个1*2矩阵(p1,p2)，那么程序认为p1,p2为向量,即向量共线
% 若输入为3个1*2矩阵(p1,p2,p3)，那么程序认为p1,p2,p3为3个点，即三点共线
% 若输入为4个1*2矩阵(p1,p2,p3,p4)，那么程序认为判断p1,p2组成的向量与,p3,p4组成的向量是否共线
% flag为0表示不是，1表示是
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

if nargin == 2
    flag = rank([p1;p2])<=1;
elseif nargin == 3
    flag = rank([p1-p2;p1-p3])<=1;
elseif nargin == 4
   flag =rank([p1-p2;p4-p3])<=1; 
end
return