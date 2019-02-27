
function par = plotResults(clusterModel, r, par)
    nodeArch = clusterModel.nodeArch;
    netArch = clusterModel.netArch;
    
    
    %%%%% number of packets sent from CHs to BS
    if r == 1
        par.packetToBS(r) = clusterModel.clusterNode.countCHs;
    else
        par.packetToBS(r) = par.packetToBS(r-1) + clusterModel.clusterNode.countCHs;
    end
   
    
    %%%%% Number of dead neurons
    par.numDead(r) = nodeArch.numDead;
   
    %%%%% Energy
    par.energy(r) = 0;
    node = clusterModel.nodeArch;
    for i = find(~node.dead)
        if node.node(i).energy > 0
            par.energy(r) = par.energy(r) + node.node(i).energy;
        end
    end
%     fig(par.energy, r, 3, 'sum of energy', 'Sum of energy of nodes vs. round'); 
    
    createfigure(1:r, par.energy, par.packetToBS, par.numDead);
    pause(0.1);
end
