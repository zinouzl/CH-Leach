function d=testintg(num)

k=[1 6 11 16 21];
k1=[5 10 15 20 25];
if(num-5<=0)
bas=0;
else
    bas=1;
end
if(any(num==k))
left=0;

else
    left = 1;
end
if(any(num==k1))
right=0;
else 
    right = 1;
end
if(num>20)
  top=0;
else 
    top=1;
end
vr=1;
if (top)
 mat(vr)=num+5;
 vr=vr+1;
end
if(left)
mat(vr)=num-1;
vr = vr+1;
end
 if(right)
     mat(vr)=num+1;
     vr=vr+1;
 end
if(bas)
    mat(vr)=num-5;
    vr=vr+1;

end

d=mat;

end