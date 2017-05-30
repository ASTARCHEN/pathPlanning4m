function [a,b,c] = getABC(p1,p2)
% ͨ������ȷ��ֱ�ߵı�׼����a*x+b*y+c=0
% p1��p2 1*2 double ��ʾ��
% ������ֵ�Ǿ�����ô����Ϊ1*3 double,��ʾa,b,c����ֵ
% ������ֵ������������ֱ��ʾa,b,c����ֵ
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