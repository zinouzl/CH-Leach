% Mohammad Hossein Homaei, Homaei@wsnlab.org & Homaei@wsnlab.ir
% Ver 1. 10/2014
function par = plotResults5(clusterModel, r, par,handles)
    nodeArch = clusterModel.nodeArch;
    netArch = clusterModel.netArch;
    
    
    %%%%% number of packets sent from CHs to BS
    if r == 1
        par.packetToBS(r) = clusterModel.clusterNode.countCHs;
    else
        par.packetToBS(r) = par.packetToBS(r-1) + clusterModel.clusterNode.countCHs;
    end
    % Figure packet to BS
%     fig(par.packetToBS, r, 1, '# of packets sent to BS nodes', ...
%         'Number of packet sent to BS vs. round');
    
    %%%%% Number of dead neurons
    par.numDead(r) = nodeArch.numDead;
    % Figure number of dead node
%     fig(par.numDead, r, 2, '# of dead nodes', 'Number of dead node vs. round');
    
    %%%%% Energy
    par.energy(r) = 0;
    node = clusterModel.nodeArch;
    for i = find(~node.dead)
        if node.node(i).energy > 0
            par.energy(r) = par.energy(r) + node.node(i).energy;
        end
    end
%     fig(par.energy, r, 3, 'sum of energy', 'Sum of energy of nodes vs. round'); 
    
    createfigure1(1:r, par.energy, par.packetToBS, par.numDead,handles);
    pause(0.1);
end
