function test1(cluster1)
ch=size(cluster1,2);
indtoberemoved =[];
for o=1:ch
       o;
       cluster1(o);
      if(cluster1(o)==1);
        indtoberemoved = [indtoberemoved,o];
      end
end
  cluster1(indtoberemoved) =[]; 
  cluster1