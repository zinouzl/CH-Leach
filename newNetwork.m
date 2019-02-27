function NetArch = newNetwork(Length, Width, sinkX, sinkY, initEnergy...
    , transEnergy, recEnergy, fsEnergy, mpEnergy, aggrEnergy)

    Yard.Type = 'Rect'; 
    if ~exist('Length','var')
        Yard.Length = 100; 
    else
        Yard.Length = Length;
    end
    if ~exist('Width','var')
        Yard.Width = 100; 
    else
        Yard.Width = Width;
    end
    
  
    if ~exist('sinkX','var')
        Sink.x = Yard.Length / 2;
    else
        Sink.x = sinkX;
    end
    if ~exist('sinkY','var')
        Sink.y = Yard.Width / 2;
    else
        Sink.y = sinkY;
    end

  
    if ~exist('initEnergy','var')
        Energy.init = 0.5; 
    else
        Energy.init = initEnergy; 
    end
    
  % (ETX)
    if ~exist('transEnergy','var')
        Energy.transfer = 50*0.000000001;
    else
        Energy.transfer = transEnergy; 
    end
    if ~exist('recEnergy','var')
        Energy.receive = 50*0.000000001;
    else
        Energy.receive = recEnergy; 
    end
    

    if ~exist('recEnergy','var')
        Energy.freeSpace = 10*0.000000000001;
    else
        Energy.freeSpace = fsEnergy; 
    end
    if ~exist('recEnergy','var')
        Energy.multiPath = 0.0013*0.000000000001;
    else
        Energy.multiPath = mpEnergy; 
    end
    
   
    if ~exist('recEnergy','var')
        Energy.aggr = 5*0.000000001;
    else
        Energy.aggr = aggrEnergy; 
    end

    NetArch = struct('Yard',   Yard, ...
                     'Sink',   Sink, ...
                     'Energy', Energy);
end