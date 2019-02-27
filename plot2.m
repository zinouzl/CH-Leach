function plot2(clusterModel)
 nodeArch = clusterModel.nodeArch;
x=nodeArch.nodesLoc(:, 1);
y=nodeArch.nodesLoc(:, 2);
CH = clusterModel.clusterNode.no;
figure(1), hold on
 for i=1:size(CH,2)
 scatter(x(CH(i)),y(CH(i)),'r');
 
 end

pause(5)


end