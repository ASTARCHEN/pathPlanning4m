function flags = inPoly(p,poly)
% �жϵ��Ƿ��ڶ������
% flag(i)Ϊ��������ô�ڣ�ż��Ϊ����
% p : pn*2 ����
% poly ��polyn*2 ����ע�⣬�����յ���Ҫ��ͬ
% See also lineInPoly
% ��л���� http://www.cnblogs.com/dwdxdy/p/3230647.html
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

if ~(poly(1,1) == poly(end,1)&&poly(1,2) == poly(end,2))
    poly = [poly;poly(1,:)];
end

pn = size(p,1);
polyn = size(poly,1);
flags = zeros(1,pn);
for i=1:pn

    if ~isempty(find(poly(:,1)==p(i,1)& poly(:,2)==p(i,2)))%�ҵ�һ����ͬ�ĵ㼴��
        flags(i) = 1;
        continue;%%����pn=1������pn=2
    end
    for j=2:polyn
        if ((((poly(j,2)<=p(i,2)) && (p(i,2) < poly(j-1,2) )) ||...
                ((poly(j-1,2) <= p(i,2)) && (p(i,2) < poly(j,2)))) && ...
                (p(i,1) < (poly(j-1,1) - poly(j,1)) * (p(i,2) - poly(j,2))/(poly(j-1,2)-poly(j,2)) + poly(j,1)))
            flags(i) = flags(i) + 1;
        end
    end
end
flags = mod(flags,2);
end