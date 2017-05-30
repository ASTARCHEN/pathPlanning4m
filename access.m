function flag = access(startPoint, endPoint, tabu)%%���յ㲻һ�������������ϵ����յ㣬����ֵΪ0ʱ���ɴ�
% �ж�startPoint, endPoint��ɵ��߶��Ƿ���tabu���ɵ��ϰ������εı��ཻ
% startPoint 1*2 double��ʾ���
% endPoint 1*2 double ��ʾ�յ�
% tabu pn*2 double ��ʾ�ϰ������Σ�ÿ����˳��������ɵĶ���Σ�����Ϊ͹����Σ�Ҳ����Ϊ������Σ����ǲ�����"��"��tabu(1,:)Ӧ����tabu(end,:)��ͬ��������ͬ�������Զ�����Ϊ��ͬ)
% Author A.Star
% e-mail : chenxiaolong12315@163.com
% 2017-5-30

    obj = tabu;
    obj = getPoly(obj);
    len_lines = size(obj,1);
     for j = 1 : (len_lines)
%          if startPoint==obj(j,:)||endPoint==obj(j,:)%%����ԭ�򣬳��ִ���
          if sum(abs(startPoint-obj(j,:)))<eps || sum(abs(endPoint-obj(j,:)))<eps%%��ʾ�������
             continue;              
          else   
             if collineation(startPoint, endPoint,obj(j,:)) && sum((endPoint-startPoint)./(obj(j,:)-endPoint))<0 &&...
                     ~(startPoint(1)>=min(obj(j,1),endPoint(1)) && startPoint(2)>=min(obj(j,2),endPoint(2)) && ...
                     startPoint(1)<=max(obj(j,1),endPoint(1)) && startPoint(2)<=max(obj(j,2),endPoint(2)))
                 flag = 0;
                 return
             end
         end
     end
    for j = 1 : (len_lines-1)
        [x,y] = getCoorWithoutEndpoint(startPoint,endPoint,obj(j,:),obj(j+1,:));
        if ~((isempty(x) && isempty(y)) || (isnan(x) && isnan(y)))
            flag = 0;
            return            
        end
    end
flag = 1;
end