function clusterModel=dissenergy(clusterModel,roundArch,r)

 nodeArch = clusterModel.nodeArchi;
    netArch  = clusterModel.netArchi;
    cluster  = clusterModel.clusters;
    numclusters = clusterModel.numclus;
    d0 = sqrt(netArch.Energy.freeSpace / ...
              netArch.Energy.multiPath);
          
ETX = netArch.Energy.transfer;
SINKx = netArch.Sink.x;
SINKy = netArch.Sink.y;
    ERX = netArch.Energy.receive;
    EDA = netArch.Energy.aggr;
    Emp = netArch.Energy.multiPath;
    Efs = netArch.Energy.freeSpace;
    packetLength = roundArch.packetLength;
    ctrPacketLength = roundArch.ctrPacketLength;

for i=1:numclusters
  cluster1 = cluster(i).node;
  cluster1;
  ch = size(cluster1,2); 
  indtoberemoved =[];
   for o=1:ch
       o;
       cluster1(o);
      if(nodeArch.dead(cluster1(o) )==1)
        indtoberemoved = [indtoberemoved,o];
        
      end
   end
    cluster1(indtoberemoved) =[];
    cluster1;
   ch1 = size(cluster1,2); 
    if ch1==0
        continue
    end
  CH = rem(r,size(cluster1,2));
  if (CH==0)
    CH = size(cluster1,2);  
  
  end
  for j=1:size(cluster1,2)
      
      CHx=nodeArch.node(cluster1(CH)).x;
      CHy=nodeArch.node(cluster1(CH)).y;
      if(j~=CH)
   
   nodex=nodeArch.node(cluster1(j)).x;
   nodey=nodeArch.node(cluster1(j)).y;
   
  distance = sqrt(((CHx-nodex)^2)+((CHy-nodey)^2));
  
   energy = nodeArch.node(cluster1(j)).energy;
        % energy for aggregation the data + energy for transferring to BS
        if(distance >= d0)
             nodeArch.node(cluster1(j)).energy = energy - ...
                 ((ETX+EDA) * packetLength + Emp * packetLength * (distance ^ 4));
        else
             nodeArch.node(cluster1(j)).energy = energy - ...
                 ((ETX+EDA) * packetLength + Efs * packetLength * (distance ^ 2));
        end
      else 
          PacketLength =  packetLength * size(cluster1,2);
           distance = sqrt(((CHx-SINKx)^2)+((CHy-SINKy)^2));
           energy = nodeArch.node(cluster1(CH)).energy;
           
           if(distance >= d0)
                
             nodeArch.node(cluster1(CH)).energy = energy - ...
                 ((ETX+EDA) * packetLength + Emp * packetLength * (distance ^ 4));
        else
             nodeArch.node(cluster1(CH)).energy = energy - ...
                 ((ETX+EDA) * packetLength + Efs * packetLength * (distance ^ 2));
           end
          nodeArch.node(cluster1(CH)).energy = nodeArch.node(CH).energy - ...
            packetLength * ERX * size(cluster1,2);
      end
      
  end
for k=1:nodeArch.numNode
    
if(nodeArch.node(k).energy<=0)
    nodeArch.dead(k)=1;
end
nodeArch.numDead = sum(nodeArch.dead(:));
end
clusterModel.nodeArchi=nodeArch;

end