
clc, clear all, close all

numNodes = 100; % number of nodes
p = 0.2;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();
spaceDiv = fspacediv(netArch,nodeArch,p);
plot1;
apprtenace = calcdiv(nodeArch);
%nextDiv = aprt(apprtenace,p);
%nodeArch = reglage(spaceDiv,nodeArch,nextDiv);
%apprtenace = calcdiv(nodeArch);
clusterModel = clustmod(netArch,nodeArch,apprtenace);
par1 = struct;
for r = 1:roundArch.numRound
    r;
    
    clusterModel = dissenergy(clusterModel, roundArch,r);
   % clusterModel = dissEnergyNonCH(clusterModel, roundArch);
   % nodeArch     = clusterModel.nodeArch; % new node architecture after select CHs
    nodeArch = clusterModel.nodeArchi;
   s=0;
    clus = clusterModel.clusters;
 
  
    for m=1:size(clus,2)
        
         elem =[];
         clust = clus(m).node;
         for p=1:size(clust,2)
             if nodeArch.node(clust(p)).energy<=0
                 elem = [elem, p];
             end
            
         end
          clust(elem) = [];
          
              if(~isempty(clust))
                s=s+1;
              end
   
    end
   par1.packetToBS(r) = s;
   par1.numDead(r) = nodeArch.numDead;
   par1.energy(r) = 0;
    node = clusterModel.nodeArchi;
    for m = find(~node.dead)
        if node.node(m).energy > 0
            par1.energy(r) = par1.energy(r) + node.node(m).energy;
        end
    end
    if nodeArch.numDead == nodeArch.numNode
        break
    end
end