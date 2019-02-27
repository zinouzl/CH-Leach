function d=aprt(region,p)
%d=region;
mat=zeros(25,1);
min=9999;
r=zeros(25,2);
for i=1:size(region.regaddap,1)
    if (mat(i)==0)
        
if(region.regaddap(i,2)<round((1-p)* region.mode))
    voisin = testintg(i);
    %while (m)
    r(i,1)=i;
    
    for j=1:size(voisin,2)
        if (mat(voisin(j))==0)
            
        if min>(abs((region.regaddap(i,2)+region.regaddap(voisin(j),2))-region.mode))
           min = (region.regaddap(i,2)+region.regaddap(voisin(j),2))-region.mode;
           r(i,2)=voisin(j);
        end
        end
        
 %       if(region.regaddap(voisin(j),2)+region.regaddap(i,2)==region.mode)
 %           % m=0;
  %          r(i,1)=i;
   %         r(i,2)=voisin(j);
    %        break
     %   elseif(region.regaddap(voisin(j),2)+region.regaddap(i,2)>round(region.mode*(1+p)))
      %      if ((j==size(voisin,2))&& (r(i,2)==0) )
       %         r(i,1)=i;
        %        r(i,2)=voisin(j);
         %       max=region.regaddap(voisin(j),2)+region.regaddap(i,2);
        %    end
        %else
            
        %    if((region.regaddap(voisin(j),2)+region.regaddap(i,2))>max)
         %       max=region.regaddap(voisin(j),2)+region.regaddap(i,2);
          %      r(i,1)=i;
           %     r(i,2)=voisin(j);
            %end
    %end 
       
    end
    if(min<9999)
            mat(i)=1;
            i
            mat(r(i,2))=1;
            min=9999;
        
        end
 end



end


d=r;


end