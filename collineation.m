function flag = collineation(p1,p2,p3,p4)
% �жϵ��Ƿ���
% ������Ϊ2��1*2����(p1,p2)����ô������Ϊp1,p2Ϊ����,����������
% ������Ϊ3��1*2����(p1,p2,p3)����ô������Ϊp1,p2,p3Ϊ3���㣬�����㹲��
% ������Ϊ4��1*2����(p1,p2,p3,p4)����ô������Ϊ�ж�p1,p2��ɵ�������,p3,p4��ɵ������Ƿ���
% flagΪ0��ʾ���ǣ�1��ʾ��
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