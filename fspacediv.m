function d= fspacediv(netarchi,nodearchi,p)
k=1;
l = round(netarchi.Yard.Length/(p*100));
w = round(netarchi.Yard.Width/(p*100));
yardsteplenght = p*netarchi.Yard.Length;
yardstepwidth = p*netarchi.Yard.Width;
%l = l * yardsteplenght;
%w = w * yardstepwidth;
pos(1)=0;
pos(2)=0;
pos(3)=yardsteplenght;
pos(4)=yardstepwidth;
w
l
for(i=1:l)
    for(j=1:w)
        hold on
        %d(k)=rectangle('position',pos);
        d{k} = rctn(pos(1),pos(2),pos(3),pos(4));
        k=k+1
       % j=j+pos(4);
        pos(2)=pos(2)+pos(4);
    end
    pos(2)=0;
    pos(1)= pos(1)+pos(3);
    %pos(1) = i;
end

end