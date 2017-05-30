function [distance path] = Dijkstra( W,st,e )  
% Dijkstra Summary of this function goes here
%   W  权值矩阵   st 搜索的起点   e 搜索的终点
% 代码取自博客 http://blog.csdn.net/zjq2010014137/article/details/38370331
% 由A.Star于2017-5-30整理
% A.Star e-mail ：chenxiaolong12315@163.com
n=length(W);%节点数  
D = W(st,:);  
visit= ones(1,n);
visit(st)=0;  
parent = zeros(1,n);%记录每个节点的上一个节点  
  
path =[];  
  
for i=1:n-1  
    temp = [];  
    %从起点出发，找最短距离的下一个点，每次不会重复原来的轨迹，设置visit判断节点是否访问  
    for j=1:n  
       if visit(j)  
           temp =[temp D(j)];  
       else  
           temp =[temp inf];  
       end  
         
    end  
      
    [value,index] = min(temp);  
     
    visit(index) = 0;  
      
    %更新 如果经过index节点，从起点到每个节点的路径长度更小，则更新，记录前趋节点，方便后面回溯循迹  
    for k=1:n  
        if D(k)>D(index)+W(index,k)  
           D(k) = D(index)+W(index,k);  
           parent(k) = index;  
        end  
    end            
end  
  
distance = D(e);%找到终点的距离  
%回溯法  从尾部往前寻找搜索路径  
t = e;  
while t~=st && t>0  
 path =[t,path];  
  p=parent(t);
  t=p;  
end  
path =[st,path];%最短路径  
  
  
end  