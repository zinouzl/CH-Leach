clc, clear all, close all

numNodes = 50; 
p = 0.1;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();

%plot1

par = struct;
 d0 = sqrt(netArch.Energy.freeSpace / ...
              netArch.Energy.multiPath);
    ETX = netArch.Energy.transfer;
    ERX = netArch.Energy.receive;
    EDA = netArch.Energy.aggr;
    Emp = netArch.Energy.multiPath;
    Efs = netArch.Energy.freeSpace;
    packetLength = roundArch.packetLength;
 for i=1:numNodes
    matDiss(i)=sqrt((nodeArch.node(i).x - netArch.Sink.x)^2+...
                     (nodeArch.node(i).y - netArch.Sink.y)^2);
    
 end
for r = 1:roundArch.numRound
    r
   
   
   locAlive = find(~nodeArch.dead);
   for i=locAlive
       
       d=matDiss(i);
      lost = EnTran(d);
      nodeArch.node(i).energy = nodeArch.node(i).energy - lost;
   
   end
for k=1:nodeArch.numNode
if(nodeArch.node(k).energy<=0)
    nodeArch.dead(k)=1;
end
nodeArch.numDead = sum(nodeArch.dead(:));
end
   par.packetToBS(r) = numNodes - nodeArch.numDead;
   par.numDead(r) = nodeArch.numDead;
   par.energy(r) = 0;
    
    for i = find(~nodeArch.dead)
        if nodeArch.node(i).energy > 0
            par.energy(r) = par.energy(r) + nodeArch.node(i).energy;
        end
    end
    if nodeArch.numDead == nodeArch.numNode
        break
    end
end