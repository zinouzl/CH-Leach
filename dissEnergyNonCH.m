function clusterModel = dissEnergyNonCH(clusterModel, roundArch)

    
    nodeArch = clusterModel.nodeArch;
    netArch  = clusterModel.netArch;
    cluster  = clusterModel.clusterNode;
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
    
    locAlive = find(~nodeArch.dead); 
    for i = locAlive 
        
        if strcmp(nodeArch.node(i).type, 'N') &&  ...
            nodeArch.node(i).energy > 0
            
            locNode = [nodeArch.node(i).x, nodeArch.node(i).y];
            countCH = length(clusterModel.clusterNode.no);
            
            [minDis, loc] = min(sqrt(sum((repmat(locNode, countCH, 1) - cluster.loc)' .^ 2)));
            minDisCH =  cluster.no(loc);
            
            if (minDis > d0)
                nodeArch.node(i).energy = nodeArch.node(i).energy - ...
                    ctrPacketLength * ETX + Emp * packetLength * (minDis ^ 4);
            else
                nodeArch.node(i).energy = nodeArch.node(i).energy - ...
                    ctrPacketLength * ETX + Efs * packetLength * (minDis ^ 2);
            end
            %Energy dissipated
            if(minDis > 0)
                nodeArch.node(minDisCH).energy = nodeArch.node(minDisCH).energy - ...
                    ((ERX + EDA) * packetLength );
            end
        end % if
    end % for
    clusterModel.nodeArch = nodeArch;
end