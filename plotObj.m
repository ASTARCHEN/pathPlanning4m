function plotObj(obj,figureNum)
% 绘制障碍物
% path ： n*2 矩阵，代表障碍物
% figureNum : 缺省值为1，绘图编号

    if nargin == 1
        figureNum = 1;
    end
    figure(figureNum)
    hold on;
    fill([obj(:,1);obj(1,1)],[obj(:,2);obj(1,2)],[rand(),rand(),rand()]);
end