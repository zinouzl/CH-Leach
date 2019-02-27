
function varargout = tcp_ga(varargin)
    
   
        defaultConfig.xy  = 10*rand(50,2);
    defaultConfig.dmat    = [];
         defaultConfig.popSize   = 100;
       defaultConfig.numIter= 1e4;
 
    
   
   
        configStruct = get_config(defaultConfig,userConfig);
    
    
    xy= configStruct.xy;
     dmat  = configStruct.dmat;
     popSize     = configStruct.popSize;
    numIter= configStruct.numIter;
    
   
    n = N;
    
    popSize     = 4*ceil(popSize/4);
    numIter     = max(1,round(real(numIter(1))));

    pop = zeros(popSize,n);
    pop(1,:) = (1:n);
    for k = 2:popSize
        pop(k,:) = randperm(n);
    end
    
    
    globalMin= Inf;
    totalDist= zeros(1,popSize);
    distHistory = zeros(1,numIter);
      tmpPop =zeros(4,n);
    newPop=zeros(popSize,n);
  
      for iter = 1:numIter
       
         for p =1:popSize
            d =dmat(pop(p,n),pop(p,1)); 
             for k = 2:n
                d = d + dmat(pop(p,k-1),pop(p,k));
            end
            totalDist(p) = d;
        end
        
      
        [minDist,index] =min(totalDist);
        distHistory(iter) = minDist;
        if minDist < globalMin
            globalMin =minDist;
            optRoute = pop(index,:);
           
        end
        %cx = rand(n);
          %if(n<4)
      
          %m = distHistory(:)
           %randomOrder = randperm(popSize);
          %end
      
           randomOrder =randperm(popSize);
         for p = 4:4:popSize
            rtes = pop(randomOrder(p-3:p),:);
                dists = totalDist(randomOrder(p-3:p));
             [ignore,idx] =min(dists); %ok
            bestOf4Route =rtes(idx,:);
              routeInsertionPoints = sort(ceil(n*rand(1,2)));
            I = routeInsertionPoints(1);
            J = routeInsertionPoints(2);
                for k = 1:4 
                tmpPop(k,:) = bestOf4Route;
                switch k
                    case 2  
                          tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                    case 3 
                        tmpPop(k,[I J]) = tmpPop(k,[J I]);
                    case 4 
                         tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                    otherwise % 
                end
                end
              newPop(p-3:p,:) = tmpPop;
        end
        pop = newPop;
        
      
        
        
    end
   
    
   
  
    if nargout
        resultStruct = struct( ...
            'xy',          xy, ...
            'dmat',        dmat, ...
            'popSize',     popSize, ...
            'numIter',     numIter, ...
              'optRoute',    optRoute, ...
            'minDist',     minDist);
        
        varargout = {resultStruct};
    end
    
end

function config = get_config(defaultConfig,userConfig)
    
  
    config = defaultConfig;
    
   
    defaultFields = fieldnames(defaultConfig);
  
    userFields = fieldnames(userConfig);
    nUserFields = length(userFields);
    for i = 1:nUserFields
        userField = userFields{i};
        isField = strcmpi(defaultFields,userField);
        if nnz(isField) == 1
            thisField = defaultFields{isField};
            config.(thisField) = userConfig.(userField);
        end
    end
    
end

