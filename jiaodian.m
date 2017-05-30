function [x,y] = jiaodian(line1,line2)
% ����ֱ��line1��line2�Ľ���
% ����line1,line2Ϊֱ�ߵı�׼��ʽax+by+c=0
% x,yΪnan�������߶�ƽ��
% ���Ϊ��������ôx,y��ʾ��������
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