function d=ilm(par)
data = par.packetToBS;
dead = par.numDead;
eneg = par.energy;
elmm =[];
 for i=1:size(data,2)
 if(data(i)==0)
  elmm=[elmm i];
 end
 end
data(elmm)=[];
dead(elmm)=[];
eneg(elmm)=[];
d.packetToBS = data;
d.numDead = dead;
d.energy = eneg;
end