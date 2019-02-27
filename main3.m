clc, clear all, close all

numNodes = 50; 
p = 0.1;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();

%plot1

par = struct;

for r = 1:roundArch.numRound
    r
   % plot1
    clusterModel = newCluster(netArch, nodeArch, 'leach1', r, p);
   % plot2(clusterModel);
    clusterModel = tatchNoeuds(clusterModel);
    if(~isstruct(clusterModel.clusterlist))
         par.packetToBS(r) = clusterModel.clusterNode.countCHs;
         par.numDead(r) = nodeArch.numDead;
         par.energy(r)= par.energy(r-1);
        %par = plotResults(clusterModel, r, par);
        clear clusterModel.chainedList clusterModel.clusterlist
        continue
    end
    clusterModel = chainedCluster (clusterModel);
    clusterModel = disEnergyCH(clusterModel, roundArch);
    clusterModel = disEnergyNonCH(clusterModel, roundArch);
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
    clear clusterModel.chainedList clusterModel.clusterlist
end