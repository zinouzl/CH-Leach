
clc, clear all, close all

numNodes = 100; % number of nodes
p = 0.2;

netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();
spaceDiv = fspacediv(netArch,nodeArch,p);
plot1;
apprtenace = calcdiv(nodeArch);
nextDiv = aprt(apprtenace,p);
nodeArch = reglage(spaceDiv,nodeArch,nextDiv);
apprtenace = calcdiv(nodeArch);
clusterModel = clustmod(netArch,nodeArch,apprtenace);
par = struct;
for r = 1:roundArch.numRound
    r;
    
    clusterModel = dissenergy(clusterModel, roundArch,r);
   % clusterModel = dissEnergyNonCH(clusterModel, roundArch);
   % nodeArch     = clusterModel.nodeArch; % new node architecture after select CHs
    nodeArch = clusterModel.nodeArchi;
    par = plotResults1(clusterModel, r, par);
    if nodeArch.numDead == nodeArch.numNode
        break
    end
end