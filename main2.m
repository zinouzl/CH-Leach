clc, clear all, close all

numNodes = 100; 
p = 0.1;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();

%plot1

par = struct;

for r = 1:roundArch.numRound
    r
    plot1
    clusterModel = newCluster(netArch, nodeArch, 'leach1', r, p);
    plot2(clusterModel);
    clusterModel = tatchNoeuds(clusterModel);
    if(~isstruct(clusterModel.clusterlist))
         par = plotResults(clusterModel, r, par);
        clear clusterModel.chainedList clusterModel.clusterlist
        continue
    end
 %0  plot3(clusterModel);
    clusterModel = chainedCluster (clusterModel);
    clusterModel = disEnergyCH(clusterModel, roundArch);
    clusterModel = disEnergyNonCH(clusterModel, roundArch);
    nodeArch     = clusterModel.nodeArch; 
    
    par = plotResults(clusterModel, r, par);
    if nodeArch.numDead == nodeArch.numNode
        break
    end
    clear clusterModel.chainedList clusterModel.clusterlist
end


