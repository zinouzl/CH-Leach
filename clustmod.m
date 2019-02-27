function d=clustmod(netarchi,nodearchi,clusternode)
d=clusternode;
d.nodeArchi =nodearchi;
d.netArchi = netarchi;
for i=1:clusternode.numclus
    k=1;
    cluster = clusternode.regaddap(i,1)
  for j=1:nodearchi.numNode
      if(nodearchi.node(j).region == cluster)
        
      initclust(i).node(k) = j;
      k=k+1;
      end
  
  end
end
d.clusters=initclust;


end