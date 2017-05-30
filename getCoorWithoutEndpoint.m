function [x,y] = getCoorWithoutEndpoint(p1,p2,p3,p4)
% ��p1,p2�����ɵ��߶���p3,p4�����ɵ��߶κ��Զ˵�Ľ���
% ����
% x,yΪ�վ��󣬴����߶��޽���
% x,yΪnan�������߶���������
% ���Ϊ��������ôx,y��ʾ��������
% ע�⣬p1,p2,p3,p4�����ʱ����Զ˵�
% �磺
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
        return%%˵�����ڽ�
    else
        x = [];
        y = [];
    end
end
end