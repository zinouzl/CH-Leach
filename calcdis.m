function minnof = calcdis(node,clusterheads,nodearch)
minno=1;
min=sqrt((nodearch.nodesLoc(node,1)-nodearch.nodesLoc(clusterheads(1),1))^2+...
           (nodearch.nodesLoc(node,2)-nodearch.nodesLoc(clusterheads(1),2))^2);
for i=2:size(clusterheads,2)
    
    test = sqrt((nodearch.nodesLoc(node,1)-nodearch.nodesLoc(clusterheads(i),1))^2+...
           (nodearch.nodesLoc(node,2)-nodearch.nodesLoc(clusterheads(i),2))^2);
if (test<min)
    min=test;
    minno = i;
end
end
minnof=minno;

end