function plotObj(obj,figureNum)
% �����ϰ���
% path �� n*2 ���󣬴����ϰ���
% figureNum : ȱʡֵΪ1����ͼ���

    if nargin == 1
        figureNum = 1;
    end
    figure(figureNum)
    hold on;
    fill([obj(:,1);obj(1,1)],[obj(:,2);obj(1,2)],[rand(),rand(),rand()]);
end