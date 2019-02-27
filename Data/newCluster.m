function clusterModel = newCluster(netArch, nodeArch, ...
                        clusterFun, clusterFunParam, p_numCluster)

    if ~exist('clusterFun','var')
        clusterFun = 'leach'; 
    end
    if strcmp(clusterFun, 'def')
        clusterFun = 'leach'; 
    end
    clusterModel.clusterFun = clusterFun;
   
    if ~exist('clusterFunParam','var')
        clusterFunParam = [];
    end
    clusterModel.clusterFunParam = clusterFunParam;
   
    if ~exist('netArch','var')
        netArch = newNetwork();
    end
    clusterModel.netArch = netArch;
    
    if ~exist('nodeArch','var')
        nodeArch = newNodes();
    end
    clusterModel.nodeArch = nodeArch;
    
    if ~exist('p_numCluster','var')
        dBS        = sqrt((netArch.Sink.x - netArch.Yard.Length) ^ 2 + ...
                          (netArch.Sink.y - netArch.Yard.Width) ^ 2);
        numCluster = clusterOptimum(netArch, nodeArch, dBS); 
        p = 1 / numCluster;
    else
        if p_numCluster < 1
            p = p_numCluster;
            numCluster = 1 / p;
        else
            numCluster = p_numCluster;
            p = 1 / numCluster;
        end
    end
   
    clusterModel.numCluster = numCluster;
    clusterModel.p          = p;
    
    
    addpath Cluster 
    [nodeArch, clusterNode] = feval(clusterFun, clusterModel, clusterFunParam); % execute the cluster function
    
    clusterModel.nodeArch = nodeArch;       
    clusterModel.clusterNode = clusterNode; 
end