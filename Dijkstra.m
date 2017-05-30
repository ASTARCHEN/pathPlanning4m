function [distance path] = Dijkstra( W,st,e )  
% Dijkstra Summary of this function goes here
%   W  Ȩֵ����   st ���������   e �������յ�
% ����ȡ�Բ��� http://blog.csdn.net/zjq2010014137/article/details/38370331
% ��A.Star��2017-5-30����
% A.Star e-mail ��chenxiaolong12315@163.com
n=length(W);%�ڵ���  
D = W(st,:);  
visit= ones(1,n);
visit(st)=0;  
parent = zeros(1,n);%��¼ÿ���ڵ����һ���ڵ�  
  
path =[];  
  
for i=1:n-1  
    temp = [];  
    %��������������̾������һ���㣬ÿ�β����ظ�ԭ���Ĺ켣������visit�жϽڵ��Ƿ����  
    for j=1:n  
       if visit(j)  
           temp =[temp D(j)];  
       else  
           temp =[temp inf];  
       end  
         
    end  
      
    [value,index] = min(temp);  
     
    visit(index) = 0;  
      
    %���� �������index�ڵ㣬����㵽ÿ���ڵ��·�����ȸ�С������£���¼ǰ���ڵ㣬����������ѭ��  
    for k=1:n  
        if D(k)>D(index)+W(index,k)  
           D(k) = D(index)+W(index,k);  
           parent(k) = index;  
        end  
    end            
end  
  
distance = D(e);%�ҵ��յ�ľ���  
%���ݷ�  ��β����ǰѰ������·��  
t = e;  
while t~=st && t>0  
 path =[t,path];  
  p=parent(t);
  t=p;  
end  
path =[st,path];%���·��  
  
  
end  