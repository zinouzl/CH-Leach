function clusterModel = disEnergyNonCH(clusterModel, roundArch)



    nodeArch = clusterModel.nodeArch;
    netArch  = clusterModel.netArch;
    cluster  = clusterModel.clusterNode;
    list = clusterModel.chainedList;
    if cluster.countCHs == 0
        return
    end
    d0 = sqrt(netArch.Energy.freeSpace / ...
              netArch.Energy.multiPath);
    ETX = netArch.Energy.transfer;
    ERX = netArch.Energy.receive;
    EDA = netArch.Energy.aggr;
    Emp = netArch.Energy.multiPath;
    Efs = netArch.Energy.freeSpace;
    packetLength = roundArch.packetLength;
    ctrPacketLength = roundArch.ctrPacketLength;
    
  %  locAlive = find(~nodeArch.dead); 
       
        for j=1:size(list,2)   
            
            clust = list(j).nodes;
            dis = list(j).distances;
          for i=1:size(dis,2)  
              rnode = clust(i);
              minDis = dis(i);
              
            if (minDis > d0)
                nodeArch.node(rnode).energy = nodeArch.node(rnode).energy - ...
                    packetLength * ETX + Emp * packetLength * (minDis ^ 4);
            else
                nodeArch.node(rnode).energy = nodeArch.node(rnode).energy - ...
                    packetLength * ETX + Efs * packetLength * (minDis ^ 2);
            end
          
            if(i<1)
                nodeArch.node(rnode).energy = nodeArch.node(enode).energy - ...
                    ((ERX + EDA) * packetLength );
            end
          end
        end  % for
    for k=1:nodeArch.numNode
if(nodeArch.node(k).energy<=0)
    nodeArch.dead(k)=1;
end
nodeArch.numDead = sum(nodeArch.dead(:));
    end
    clusterModel.nodeArch = nodeArch;
end