function clusterModel = tatchNoeuds(clusterModel)

listeClusterHead = clusterModel.clusterNode;

nodes = clusterModel.nodeArch;

locAlive = find(~nodes.dead);
j=1;
for i=locAlive
    if(nodes.node(i).type~='C')
listNoClusterHeads(j) = i;
j=j+1;
    end
end
if (listeClusterHead.countCHs==0)
clusterModel.clusterlist = -1;
return
end
for i=1:size(listeClusterHead.no,2)
    clusterChema(i).tab(1)=listeClusterHead.no(i);
    clusterChema(i).xy(1,1)=nodes.nodesLoc(listeClusterHead.no(i),1);
    clusterChema(i).xy(1,2)=nodes.nodesLoc(listeClusterHead.no(i),2);

end
if(exist('listNoClusterHeads'))
for i=listNoClusterHeads
    clusternumm = calcdis(i,listeClusterHead.no,nodes);
    clusterChema(clusternumm).tab = [clusterChema(clusternumm).tab,i];
    clusterChema(clusternumm).xy = [clusterChema(clusternumm).xy;nodes.nodesLoc(i,1),nodes.nodesLoc(i,2)];
end
end
clusterModel.clusterlist = clusterChema;

end