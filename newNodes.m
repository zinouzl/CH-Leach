function nodeArch = newNodes(netArch, numNode)

    
    if ~exist('netArch','var')
        netArch = newNetwork();
    end
    
    if ~exist('numNode','var')
        numNode = 100;
    end
    for i = 1:numNode
        
        nodeArch.node(i).x      =   rand * netArch.Yard.Length;
        nodeArch.nodesLoc(i, 1) =   nodeArch.node(i).x;
        
        nodeArch.node(i).y      =   rand * netArch.Yard.Width;
        nodeArch.nodesLoc(i, 2) =   nodeArch.node(i).y;
        
        nodeArch.node(i).G      =   0; 
      
        nodeArch.node(i).type   =   'N';
        nodeArch.node(i).energy =   netArch.Energy.init;
        
        nodeArch.node(i).CH     = -1; 
        nodeArch.dead(i)        = 0; 
        
        nodeArch.node(i).region = floor((nodeArch.node(i).y/20)+1)+floor(nodeArch.node(i).x/20)*5;
        
    end
    nodeArch.numNode = numNode; 
    nodeArch.numDead = 0; 
end