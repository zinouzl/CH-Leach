
clc, clear all, close all

numNodes = 50; % number of nodes
p = 0.1;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();



par = struct;

for r = 1:roundArch.numRound
    r
    clusterModel = newCluster(netArch, nodeArch, 'leach1', r, p);
    clusterModel = dissEnergyCH(clusterModel, roundArch);
    clusterModel = dissEnergyNonCH(clusterModel, roundArch);
    nodeArch     = clusterModel.nodeArch; 
    
    par.packetToBS(r) = clusterModel.clusterNode.countCHs;
   par.numDead(r) = nodeArch.numDead;
   par.energy(r) = 0;
    node = clusterModel.nodeArch;
    for i = find(~node.dead)
        if node.node(i).energy > 0
            par.energy(r) = par.energy(r) + node.node(i).energy;
        end
    end
    
    if nodeArch.numDead == nodeArch.numNode
        break
    end
end


