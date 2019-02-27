function d=gasearch(tab,xy,handles)
for i=1:size(tab,2)
dex(i) = tab(i);
end
%xy = rand(10,2)*100;
nPoints = size(xy,1);
a = meshgrid(1:nPoints);
dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),nPoints,nPoints);
dmat(size(dmat,1)+1,1)=0;
dmat(1,size(dmat,2)+1)=0;
dmat(size(dmat,1),2:size(dmat,2)-1)=9999;
dmat(2:size(dmat,1)-1,size(dmat,2))=9999;
xy(size(xy,1)+1,1)=0;
xy(size(xy,1),2)=0;
userConfig = struct('xy',xy,'dmat',dmat,'showResult',0,'showProg',0,'numIter',100);
resultStruct = tsp_ga(userConfig);
bestPath = resultStruct.optRoute;
fkPoint  = size(xy,1);
indx = find(bestPath==fkPoint);
i = indx+1;
j=1;
 m = rem(i,size(bestPath,2));
 if(m==0)
      m=size(bestPath,2); 
  end
while(indx ~= m)
 
 
mat(j) = bestPath(m);
j=j+1;
i=i+1;
 m = rem(i,size(bestPath,2));
  if(m==0)
      m=size(bestPath,2); 
  end
end
if (mat(1)==1)
   mat = fliplr(mat);
end
rte = mat([1:size(mat,2)]);
mat1.nodes = dex(mat(:));
for i=1:size(mat,2)-1
mat1.distances(i) = dmat(mat(i),mat(i+1));  
end    
if(size(mat,2)==1)
    mat1.distances(1)=[0];
end
%set(gca,'XLim',[0 numIter+1],'YLim',[0 1.1*max([1 distHistory])]);
%xy(:,1)
%xy(:,2)
axes(handles.axes2);hold on
 plot(xy(rte,1),xy(rte,2),'g.-');
 
hold off              %  title(sprintf('Total Distance = %1.4f, Iteration = %d',5,5));
     pause(1);           %drawnow;
              %  Elec = 5.e-8;
               % Eamp = 1.e-10;
                %s=0;
                %ss=0;
                %for i=1:size(mat1.distances,2)
                 %  ss=ss+EnTran(Elec,Eamp,1,dmat(1,i));
                %s=EnTran(Elec,Eamp,1,mat1.distances(i))+s;
                %end
                %s
                %ss
                %s<ss
                
d=mat1;
end
