function [x,y] = getCoor(p1,p2,p3,p4)
% ��p1,p2�����ɵ��߶���p3,p4�����ɵ��߶εĽ���
% ����
% x,yΪ�վ��󣬴����߶��޽���
% x,yΪnan�������߶�ƽ��
% ���Ϊ��������ôx,y��ʾ��������
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