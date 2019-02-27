function d=rctn(x,y,h,w)
X = [x,x+h,x+h,x];
Y = [y,y,y+w,y+w];
%plot(X,Y);
line1=line([x,x+h],[y,y]);
line2=line([x+h,x+h],[y,y+w]);
line3=line([x,x+h],[y+w,y+w]);
line4=line([x,x],[y,y+w]);
d=[line1,line2,line3,line4];
%{
d(1,1)= x;
d(1,2)= y;


d(2,1)=x+h;
d(2,2)=y;
d(3,1)=x+h;
d(3,2)= y+w;
d(4,1)= x;
d(4,2)=y+w;
%}
end