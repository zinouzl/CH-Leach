function plotpck(ch,l,s,g)
j=1;
for i=1:50:1000
ch1(j) =ch(i);
j=j+1;
end
j=1;
for i=1:50:500
s1(j) =s(i);
j=j+1;
end
j=1
for i=1:50:400
l1(j) =l(i);
j=j+1;
end
j=1;
for i=1:50:450
s1(j) =s(i);
j=j+1;
end
plot(ch1,'color','r');
hold on 
plot(l1,'color','b');
plot(s1,'color','g');
%plot(g1,'color','y');

end