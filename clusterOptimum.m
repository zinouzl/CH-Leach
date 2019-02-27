function kOpt = clusterOptimum(netArch, nodeArch, dBS)



    N    = nodeArch.numNode; % number of nodes
    M    = sqrt(netArch.Yard.Length * netArch.Yard.Width);
    kOpt = sqrt(N) / sqrt(2*pi) * ...
           sqrt(netArch.Energy.freeSpace / netArch.Energy.multiPath) * ...
           M / dBS ^ 2;
    kOpt = round(kOpt);
end