function plotPath(path,figureNum,color)
% ����·��
% path �� n*2 ���󣬴���·��
% figureNum : ȱʡֵΪ1����ͼ���
    if nargin == 1
        figureNum = 1;
    end
    figure(figureNum)
    hold on;
    plot(path(:,1),path(:,2),'ro','linewidth',3);
    line(path(:,1),path(:,2),'linewidth',3,'color','r')
end