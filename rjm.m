NodeNums = 1000; % the num of node  
AreaR = 2000 ;   % the area of simulate 
NodeTranR=10;   %  the transit Radius 
Elec=50 * 10^(-9); % 
Eamp=100*10^(-12);  
Bx=0;  % The Postion of Baseation 
By=AreaR+400; 
MaxInteral = 100; % the leach simulate time 
Pch=0.05;  % the desired percentage of cluster heads  
InitEn=4;  % the init energy of all node 
MaxEn=InitEn; 
Tr=100;  % the time of round  
Kbit=2000; % the bits of a node transmiting a packet every time 
Gathingcoefficient=0.8; 
BandWitch = 1*10.^(6); %  Channel Bandwitch 
Threshold=0;    % the threshold of node becoming a cluster-head 
TDMA=400; 
Cprob=0.04; 
NON_CH					= 0;%			// non cluster head 
TENTATIVE_CH			= 1; %			// tentative cluster head				 
FINAL_CH				= 2;%				// final cluster head 
sym ClusterHeadNum ; 
ClusterHeadNum=0; 
TOS_LOCAL_ADDRESS = -1;       % TOS_LOCAL_ADDRESS  must <=0 
for i=1:(MaxInteral) 
    AliveNode(i)=NodeNums; 
end 
%     Node.x=AreaR*rand(1,NodeNums);  % the position of node  
%     Node.y=AreaR*rand(1,NodeNums); 
      sym buchang; 
      buchang = (AreaR/NodeNums); 
     % buchang=int(buchang); 
      Node.x=0:buchang:(buchang.*(NodeNums-1));  % the position of node  
      Node.y=0:buchang:(buchang.*(NodeNums-1)); 
 
    Node.IsClusterHeads=linspace(0,0,NodeNums); % NON_CH,TENTATIVE_CH,FINAL_CH 
    Node.IsCovered=linspace(0,0,NodeNums);      % Have Been Covered by a cluster head 1:yes 0:No 
    Node.c=linspace(0,0,NodeNums);              % the Cluster head of node 
    Node.chcost=linspace(0,0,NodeNums);              % the Cluster head of node 
    Node.d=linspace(0,0,NodeNums);              % the distance between cluster head and node 
    Node.l=zeros(1,NodeNums)+Kbit;           % the length of node i transmit packet 
    Node.EnNode=zeros(1,NodeNums)+InitEn;    % the init energy of all node 
    Node.StateNode=ones(1,NodeNums);      % the State of all node 1: alive 0:dead 
    Node.Listothernode=zeros(NodeNums);         % if node is a cluster head,Listothernode save the id of node belong to this cluster        
    Node.csize=linspace(0,0,NodeNums);          % cluser size ,each cluster node num 
    Node.Nbr=zeros(NodeNums);                   % neighbor of node 
    Node.NumNbr=linspace(0,0,NodeNums);         % the neighbor's num of node 
    %Node.DistNbr=linspace(0,0,NodeNums);         % the neighbor's dist of node 
    Node.CHprob=zeros(1,NodeNums)+Cprob;  
     Node.InitCHprob=zeros(1,NodeNums); 
    Node.tent_CH=zeros(1,NodeNums)+NON_CH;  
    Node.tent_CH_Cost=ones(1,NodeNums)+9999; 
    Node.IsaddDummyRound=linspace(0,0,NodeNums); 
    Node.n_finalCH=linspace(0,0,NodeNums);  
    Node.ListfinalCH=zeros(NodeNums); 
    Node.ListfinalCH_Cost=zeros(NodeNums)+9999; 
    Node.n_tentCH=linspace(0,0,NodeNums);  
    Node.ListtentCH=zeros(NodeNums); 
    Node.ListtentCH_Cost=zeros(NodeNums)+9999; 
    Node.my_finalCH=linspace(0,0,NodeNums); 
    Node.my_tentCH=linspace(0,0,NodeNums); 
    Node.my_final_CH_Cost=ones(1,NodeNums)+9999; 
    Node.Isstop=ones(1,NodeNums);    % clustering is end ? 1:no,0:yes 
 for i=1:NodeNums 
     count =0 ; 
    for j=1:NodeNums 
        
        if(j~=i)  
        dist = ((Node.x(i)-Node.x(j)).^2)+((Node.y(i)-Node.y(j)).^2);  % the distance.^2 
               if dist < (Tr.^2+Tr.^2)   
                   count=count+1; 
                   Node.Nbr(i,count)=j; 
                    
               end 
                   
         end 
         if j== NodeNums  
                Node.NumNbr(i) = count ; 
         end   
    end  
 end 
   
 syms filen strnumnode tpye strround; 
     strnumnode = int2str(NodeNums); 
      filen = date; 
      type = 'NetWork'; 
       
      filen=['result\heed\',type,strnumnode,' ',filen,'.txt']; 
      fid= fopen(filen,'w'); 
       for i=1:NodeNums   % The Node ID ,position x,position y,The number of  neighbr node,The ID all  neighbr node 
        
        fprintf(fid,'%6d,%10.4f,%10.4f,%6d',i,Node.x(i),Node.y(i),Node.NumNbr(i)); 
          for j=1:Node.NumNbr(i) 
              fprintf(fid,',%6d',Node.Nbr(i,j)); 
          end 
          fprintf(fid,'\r\n'); 
      end 
      fclose(fid);   
 sym iteration; 
 for Rounds = 1:MaxInteral   
       
       % the Setup phase of cluster 
      Node.CHprob=Cprob.*((Node.EnNode)./MaxEn); 
      Node.InitCHprob=Node.CHprob; 
      Node.IsaddDummyRound=0.*(Node.IsaddDummyRound);  %clear 
      Node.n_finalCH=Node.n_finalCH-Node.n_finalCH;  
      Node.ListfinalCH=Node.ListfinalCH-Node.ListfinalCH; 
      Node.ListfinalCH_Cost=Node.ListfinalCH_Cost-Node.ListfinalCH_Cost+9999; 
      Node.my_finalCH=Node.my_finalCH-Node.my_finalCH; 
      Node.my_final_CH_Cost=(Node.my_final_CH_Cost-Node.my_final_CH_Cost)+9999; 
      Node.n_tentCH=Node.n_tentCH-Node.n_tentCH;  
      Node.ListtentCH=Node.ListtentCH-Node.ListtentCH; 
      Node.ListtentCH_Cost=Node.ListtentCH_Cost-Node.ListtentCH_Cost+9999; 
      Node.csize=Node.csize-Node.csize; 
      Node.Isstop = Node.StateNode ; 
      Node.tent_CH=Node.tent_CH-Node.tent_CH+NON_CH; 
      Node.tent_CH_Cost=Node.tent_CH_Cost-Node.tent_CH_Cost+9999; 
      Node.c=Node.c-Node.c; 
      Node.d=Node.d-Node.d; 
      ClusterHeadNum=0; 
      Node.IsClusterHeads=Node.IsClusterHeads-Node.IsClusterHeads+NON_CH; 
      iteration=0; 
     while sum(Node.Isstop)~=0 
         iteration=iteration+1; 
      for i =1:NodeNums 
       if Node.Isstop(i)==1   
          if Node.CHprob(i)<1 
             if   Node.tent_CH(i)==NON_CH 
              if rand(1,1)<Node.CHprob(i) 
                 Node.IsClusterHeads(i)=TENTATIVE_CH;  
                 Node.tent_CH(i)=TOS_LOCAL_ADDRESS; 
                 Node.tent_CH_Cost(i)=Node.NumNbr(i); 
              end 
              %elseif  Node.tent_CH(i)==TOS_LOCAL_ADDRESS 
             end 
               Node.CHprob(i)=Node.CHprob(i).*2; 
%              if Node.InitCHprob(i)<0.02 
%               Node.CHprob(i)=Node.CHprob(i).*2; 
%              else 
%               Node.CHprob(i)=Node.CHprob(i).*(1+1000.*( Node.InitCHprob(i).^2)); 
%              end  
          else 
              if   Node.tent_CH(i)~=TOS_LOCAL_ADDRESS && Node.IsaddDummyRound(i)==0 
               Node.IsaddDummyRound(i)=1; 
              else 
                 for j=1:NodeNums   %Node.n_finalCH(i) 
                    if Node.ListfinalCH(i,j) ~=0 
                     if Node.my_final_CH_Cost(i) > Node.ListfinalCH_Cost(i,j)  
                         Node.my_finalCH(i)= Node.ListfinalCH(i,j); 
                         Node.my_final_CH_Cost(i)=Node.ListfinalCH_Cost(i,j); 
                     end 
                    end   
                 end 
                 % choose cluster head 
                  Node.Isstop(i)=0;   % diedai end   until CHprob==1 
                  if Node.my_finalCH(i) ~= NON_CH 
                     Node.IsClusterHeads(i)= NON_CH; 
                     Node.c(i)=Node.my_finalCH(i); 
                     Node.chcost=Node.my_final_CH_Cost(i); 
                     %join the cluster  
                     dist =Tr.^2+Tr.^2; % ((Node.x(i)-Node.x(curentnbr)).^2)+((Node.y(i)-Node.y(curentnbr)).^2);  % the distance.^2 
                     EntranPCH=EnTran(Elec,Eamp,Kbit,dist) ; 
                     Node.d(i)=((Node.x(i)-Node.x(Node.c(i))).^2)+((Node.y(i)-Node.y(Node.c(i))).^2);  % the distance.^2 
                     Node.EnNode(i)=Node.EnNode(i)-EntranPCH; 
                     if Node.EnNode(i) <= 0 
                        Node.StateNode(i)=0; 
                        Node.Isstop(i)=0; 
                        Node.EnNode(i)=0; 
                                        
                     end 
                    EnRecP=EnRec(Elec,Kbit); 
                    Node.EnNode(Node.c(i))=Node.EnNode(Node.c(i))-EnRecP; 
                    if Node.EnNode(Node.c(i)) <= 0 
                        Node.StateNode(Node.c(i))=0; 
                        Node.Isstop(Node.c(i))=0; 
                        Node.EnNode(Node.c(i))=0;  
                    else                    
                        Node.csize(Node.c(i))=Node.csize(Node.c(i))+1;  % cluster size add one 
                    end 
                 else 
                     Node.IsClusterHeads(i)= FINAL_CH; 
                     Node.my_finalCH(i)=TOS_LOCAL_ADDRESS; 
                     Node.c(i)=TOS_LOCAL_ADDRESS; 
                     Node.my_final_CH_Cost(i)= Node.NumNbr(i);%computeDegree(i); 
                     Node.chcost=Node.my_final_CH_Cost(i); 
                     Node.d(i)=((Node.x(i)-Bx).^2)+((Node.y(i)-By).^2);  % the distance.^2 
                     ClusterHeadNum=ClusterHeadNum+1; 
                  end 
             end     
           end 
          end 
         end 
       
      % compute consume energy 
        for i=1:NodeNums 
            if Node.IsClusterHeads(i) == TENTATIVE_CH  % & Node.tent_CH(curentnbr)==TOS_LOCAL_ADDRESS 
                dist =Tr.^2+Tr.^2; % ((Node.x(i)-Node.x(curentnbr)).^2)+((Node.y(i)-Node.y(curentnbr)).^2);  % the distance.^2 
                   EntranPCH=EnTran(Elec,Eamp,Kbit,dist) ; 
                   Node.EnNode(i)=Node.EnNode(i)-EntranPCH; 
                   if Node.EnNode(i) <= 0 
                        Node.StateNode(i)=0; 
                        Node.Isstop(i)=0; 
                        Node.EnNode(i) =0; 
                   end 
                for j=1:Node.NumNbr(i) 
                    curentnbr = Node.Nbr(i,j); 
                     EnRecP=EnRec(Elec,Kbit); 
                   Node.EnNode(curentnbr)=Node.EnNode(curentnbr)-EnRecP; 
                   Node.ListtentCH(curentnbr,i) = i; 
                   Node.ListtentCH_Cost(curentnbr,i)=Node.NumNbr(i);%Node.computeDegree(i); 
                   if (Node.ListtentCH(curentnbr,i)==0) 
                           Node.n_tentCH(curentnbr)=Node.n_tentCH(curentnbr)+1;     
                   end 
                   if Node.EnNode(curentnbr) > 0 
                     
                      if (Node.ListtentCH(curentnbr,i)==0) 
                           Node.n_tentCH(curentnbr)=Node.n_tentCH(curentnbr)+1;     
                      end  
                      Node.ListtentCH(curentnbr,i) = i; 
                      Node.ListtentCH_Cost(curentnbr,i)=Node.NumNbr(i);%Node.computeDegree(i); 
                        
                      % if Node.tent_CH(curentnbr)~=TOS_LOCAL_ADDRESS &(Node.tent_CH(curentnbr)==NON_CH | Node.tent_CH_Cost(i)< Node.tent_CH_Cost(curentnbr)  | ((Node.tent_CH_Cost(i)== Node.tent_CH_Cost(curentnbr) ) & i < Node.tent_CH(curentnbr))) 
                        if(Node.tent_CH(curentnbr)==NON_CH | Node.tent_CH_Cost(i)< Node.tent_CH_Cost(curentnbr)  | ((Node.tent_CH_Cost(i)== Node.tent_CH_Cost(curentnbr) ) & i < Node.tent_CH(curentnbr))) 
                        
                                  Node.tent_CH_Cost(curentnbr)=Node.tent_CH_Cost(i); 
                                                            
%                              if Node.tent_CH(curentnbr)==TOS_LOCAL_ADDRESS 
%                                    if Node.IsClusterHeads(curentnbr) ==TENTATIVE_CH 
%                                         Node.IsClusterHeads(curentnbr) = NON_CH; 
%                                     end 
%                                         dist =Tr.^2+Tr.^2; % ((Node.x(i)-Node.x(curentnbr)).^2)+((Node.y(i)-Node.y(curentnbr)).^2);  % the distance.^2 
%                                     EntranPCH=EnTran(Elec,Eamp,Kbit,dist) ; 
%                                     Node.EnNode(curentnbr)=Node.EnNode(curentnbr)-EntranPCH; 
%                                if Node.EnNode(curentnbr) <= 0 
%                                       Node.StateNode(curentnbr)=0; 
%                                       Node.Isstop(curentnbr)=0; 
%                                       Node.EnNode(curentnbr) =0; 
%                                 else  
%                                   for k=1:Node.NumNbr(curentnbr) 
%                                     tempcurentnbr = Node.Nbr(curentnbr,k); 
%                                     EnRecP=EnRec(Elec,Kbit); 
%                                     Node.EnNode(tempcurentnbr)=Node.EnNode(tempcurentnbr)-EnRecP; 
%                                    if Node.ListtentCH(tempcurentnbr,curentnbr)~=0 
%                                     Node.n_tentCH(tempcurentnbr)=Node.n_tentCH(tempcurentnbr)-1;    
%                                     Node.ListtentCH(tempcurentnbr,curentnbr)=0; 
%                                    end 
%                                    if Node.tent_CH(tempcurentnbr)==curentnbr     % change tent CH 
%                                         
%                                        if  Node.n_tentCH(tempcurentnbr) <=0      
%                                        Node.tent_CH(tempcurentnbr)=NON_CH; 
%                                        Node.tent_CH_Cost(tempcurentnbr)=9999; 
%                                        else 
%                                            Node.tent_CH_Cost(tempcurentnbr)=9999; 
%                                            for ll=1:NodeNums    
%                                             if Node.ListtentCH(tempcurentnbr,ll) ~=0 
%                                                if Node.my_tent_CH_Cost(tempcurentnbr) > Node.ListtentCH_Cost(tempcurentnbr,ll)  
%                                                   Node.my_tentCH(tempcurentnbr)= Node.ListtentCH(tempcurentnbr,ll); 
%                                                   Node.my_tent_CH_Cost(tempcurentnbr)=Node.ListtentCH_Cost(tempcurentnbr,ll); 
%                                                end 
%                                              end   
%                                            end 
%                                        end 
%                                     end 
%                                      if Node.EnNode(tempcurentnbr) <= 0 
%                                        Node.StateNode(tempcurentnbr)=0; 
%                                        Node.Isstop(tempcurentnbr)=0; 
%                                        Node.EnNode(tempcurentnbr) =0; 
%                                      end 
%                                   end 
%                               end 
%                                   
%                            end 
%                          
                         Node.tent_CH(curentnbr)=i; 
                        end     % if(Node.tent_CH(curentnbr)==NON_CH | Node.tent_CH_Cost(i)< Node.tent_CH_Cost(curentnbr) 
                   else 
                         Node.StateNode(curentnbr)=0; 
                         Node.Isstop(curentnbr)=0; 
                         Node.EnNode(curentnbr)=0;  
                   end   
                    
                end 
            elseif  Node.IsClusterHeads(i) == FINAL_CH 
                dist = Tr.^2+Tr.^2; %((Node.x(i)-Node.x(curentnbr)).^2)+((Node.y(i)-Node.y(curentnbr)).^2);  % the distance.^2 
                   EntranPCH=EnTran(Elec,Eamp,Kbit,dist) ; 
                   Node.EnNode(i)=Node.EnNode(i)-EntranPCH; 
                   if Node.EnNode(i) <= 0 
                        Node.StateNode(i)=0; 
                        Node.Isstop(i)=0; 
                        Node.EnNode(i)=0; 
                   end   
                for j=1:Node.NumNbr(i) 
                    curentnbr = Node.Nbr(i,j); 
                    EnRecP=EnRec(Elec,Kbit); 
                   Node.EnNode(curentnbr)=Node.EnNode(curentnbr)-EnRecP; 
                   if Node.EnNode(curentnbr) > 0 
                       if (Node.ListfinalCH(curentnbr,i)==0) 
                           Node.n_finalCH(curentnbr)=Node.n_finalCH(curentnbr)+1;     
                       end 
                            
                      Node.ListfinalCH(curentnbr,i)=i; 
                      Node.ListfinalCH_Cost(curentnbr,i)=Node.NumNbr(i);%Node.computeDegree(i); 
                   else 
                         Node.EnNode(curentnbr)=0;  
                         Node.StateNode(curentnbr)=0; 
                         Node.Isstop(curentnbr)=0; 
                   end     
                end 
            end 
        end   
      end 
 
   %  recorder  
    
     fid = fopen('result\heed\iterations.txt','a'); 
       fprintf(fid,'%6d,',iteration); 
        fclose(fid); 
       strnumnode = int2str(NodeNums); 
       filen = date; 
       type = 'ClustringEn'; 
       strround=int2str(Rounds); 
       filen=['result\heed\',strround,type,strnumnode,' ',filen,'.txt']; 
        fid= fopen(filen,'w'); 
   for i=1:NodeNums     %  the Node Id,his Cluster Head and His remain energy before TDMA . The energy after TDMA - The energy before  TDMA = the consume energy TDMA 
        
        fprintf(fid,'%6d,%6d,%8.4f\r\n',i,Node.c(i),Node.EnNode(i)); 
   end 
     fclose(fid); 
     %% TDMA  
     for i=1:NodeNums 
       if Node.StateNode(i) ~=0 
         if Node.IsClusterHeads(i) == NON_CH 
             EntranPCH=EnTran(Elec,Eamp,Kbit,Node.d(i)) ; 
             Node.EnNode(i)=Node.EnNode(i)-(TDMA.*EntranPCH); 
             if Node.EnNode(i) <= 0 
                        Node.StateNode(i)=0; 
                        Node.EnNode(i)=0; 
                        
             end  
              EnRecP=EnRec(Elec,Kbit); 
              Node.EnNode(Node.c(i))=Node.EnNode(Node.c(i))-EnRecP;  
                   if Node.EnNode(Node.c(i)) <= 0 
                        Node.StateNode(Node.c(i))=0; 
                        Node.EnNode(Node.c(i))=0; 
                    end 
         else 
             EntranPCH=EnTran(Elec,Eamp,Kbit.*Node.csize(i).*Gathingcoefficient,Node.d(i)) ; 
             Node.EnNode(i)=Node.EnNode(i)-(TDMA.*EntranPCH); 
              
             if Node.EnNode(i) <= 0 
                        Node.StateNode(i)=0; 
                        Node.EnNode(i)=0; 
                        
             end  
         end 
      end  
     end 
     %% 
      
    strnumnode = int2str(NodeNums); 
       filen = date; 
       type = 'EachRoundAllEn'; 
       strround=int2str(Rounds); 
       filen=['result\heed\',strround,type,strnumnode,' ',filen,'.txt']; 
        fid= fopen(filen,'w'); 
   for i=1:NodeNums                   %  the Node Id,his Cluster Head and His remain energy after TDMA 
        
        fprintf(fid,'%6d,%6d,%8.4f\r\n',i,Node.c(i),Node.EnNode(i)); 
   end 
     fclose(fid);   
     
        strnumnode = int2str(NodeNums); 
       filen = date; 
       type = 'ClusterHead'; 
       strround=int2str(Rounds); 
       filen=['result\heed\',strround,type,strnumnode,' ',filen,'.txt']; 
        fid= fopen(filen,'w'); 
        fprintf(fid,'%6d, ',ClusterHeadNum);   % write the Num of Cluster Head,then write Id of Cluster Head 
   for i=1:NodeNums 
        if  Node.IsClusterHeads(i) ~= NON_CH 
        fprintf(fid,'%6d, ',i); 
        end 
   end 
       fprintf(fid,'\r\n'); 
     fclose(fid);   
 end 
  