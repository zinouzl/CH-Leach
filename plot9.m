function plot9(clusterModel,handles)
ch = clusterModel.clusterNode.loc;
axes(handles.axes2);
hold on 
s=size(ch,1);

for i=1:s
x=[ch(i,1),50];
y=[ch(i,2),175];
plot(x,y,'y.-');

end


hold off

end