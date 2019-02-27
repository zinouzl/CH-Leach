function clusterModel=chainedCluster (clusterModel,handles)
list = clusterModel.clusterlist;
  
for i=1:size(list,2)
    
    d =  gasearch(list(i).tab,list(i).xy,handles);
    d;
    clusterModel.chainedList(i) = d;
  
end



end