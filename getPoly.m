function points = getPoly(points)
% ���ض���εı�׼��ʽ
% ��points(1,:)��Ҫ��points(end,:)��ͬ
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30
if sum(points(1,:) == points(end,:)) ~= 2%���������ȣ����أ�1,1��
    points = [points;points(1,:)];
end
end