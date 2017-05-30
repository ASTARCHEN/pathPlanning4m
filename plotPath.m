function plotPath(path,figureNum,color)
% 绘制路径
% path ： n*2 矩阵，代表路径
% figureNum : 缺省值为1，绘图编号
    if nargin == 1
        figureNum = 1;
    end
    figure(figureNum)
    hold on;
    plot(path(:,1),path(:,2),'ro','linewidth',3);
    line(path(:,1),path(:,2),'linewidth',3,'color','r')
end