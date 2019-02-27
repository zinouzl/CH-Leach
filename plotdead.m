function plotdead(parch,parl,pars,parg,max)
for i=1:size(parch.numDead,2)
ch(i)=max - parch.numDead(i);
end
for i=1:size(parl.numDead,2)
l(i)=max - parl.numDead(i);
end
for i=1:size(pars.numDead,2)
s(i)=max - pars.numDead(i);
end
for i=1:size(parg.numDead,2)
g(i)=max - parg.numDead(i);
end

plot(ch,'color','r');
hold on 
plot(l,'color','b');
plot(s,'color','g');
plot(g,'color','y');

end
