function d=EnTran(dis)
Eam = 10*0.000000000001;
Ef =  0.0013*0.000000000001;
Elec=5*10^-8;
kbit=4000;
d0 = sqrt(Eam /Ef);
              
if (dis<d0)
    d = ((Elec * kbit) + (kbit * Eam * (dis^2)));
else
    
   d =  ((Elec * kbit) + (kbit * Ef * (dis^4)))  ; 
    
end







end