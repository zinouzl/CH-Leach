function d=reglage(rect,nodearchi,fusion)
d=nodearchi;
A=[1,2,3,4,5;6,7,8,9,10;11,12,13,14,15;16,17,18,19,20;21,22,23,24,25];

n = size(fusion,1);
for i=1:n
 if(fusion(i,1)>0)
     a1=A(fusion(i,1));
     a2=A(fusion(i,2));
     delsline(rect{a1},rect{a2});
     for j=1:size(d.node,2)
       if(d.node(j).region==fusion(i,2))
         d.node(j).region=fusion(i,1); 
       
       end
     
     
     end
         
     


end
end