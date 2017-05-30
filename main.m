clc
clear
close all
obj1 = [1,1;1,4;4,4;4,2];
obj2 = [2,10;6,10;6,8;2,6];
obj3 = [1.2,7;1.6,7;1.6,9;1.2,9];
obj4 = [5.5,1;6,1;6,5];
obj5 = [2.5,5;3.5,6.2;4.3,5.7;4,5.2;3.8,4.5];
obj6 = [4.5,4;5,3.5;5,2;4.2,2.5;4.7,2.5];
obj7 = [1.2,9.8;1.7,9.8;1.7,9.1;1.2,9.1;1.2,9.4;1.5,9.4;1.5,9.6;1.2,9.6];
% % obj1 = [15,85;18,82;19,75;16,77];
% % obj2 = [5,70;14,71;15,62;13,55;5,55];
% % obj3 = [20,65;30,60;35,40;25,35;20,38];
% % obj4 = [45,85;50,80;50,53;40,52;40,81];
% % obj5 = [45,48;50,38;48,33;44,37];
% % obj6 = [58,75;62,72;62,35;52,30;52,72];
% % obj7 = [59,25;63,30;75,25;72,18];
% % obj8 = [81,12;81,22;86,30;90,28;87,12];
figureNum=1;
plotObj(obj1,figureNum)
plotObj(obj2,figureNum)
plotObj(obj3,figureNum)
plotObj(obj4,figureNum)
plotObj(obj5,figureNum)
plotObj(obj6,figureNum)
plotObj(obj7,figureNum)
% plotObj(obj8,figureNum)
startPoint = [1.7,9.5];
endPoint = [6,1];
tabu{1} = obj1;
tabu{2} = obj2;
tabu{3} = obj3;
tabu{4} = obj4;
tabu{5} = obj5;
tabu{6} = obj6;
tabu{7} = obj7;
% tabu{8} = obj8;
% % % len_tabu = length(tabu);
% % % for k = 1 : len_tabu 
% % %    if (inPoly(startPoint,tabu{k})&& ~onpolysite(startPoint,tabu{k}))
% % %        startPoint=adjust(startPoint,tabu{k});
% % %        break;
% % %    end
% % % end
% % % for k = 1 : len_tabu 
% % %    if (inPoly(endPoint,tabu{k})&& ~onpolysite(endPoint,tabu{k}))
% % %        endPoint=adjust(endPoint,tabu{k});
% % %        break;
% % %    end
% % % end    
[dis,path] = getPath(startPoint,endPoint,tabu);
plotPath(path,figureNum);