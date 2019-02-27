
fig = figure(1);
clf(fig);
 figure(1) ,hold on

x=nodeArch.nodesLoc(:, 1);
y=nodeArch.nodesLoc(:, 2);
plot(x, y,...
    '.', 'MarkerSize',15);
plot(netArch.Sink.x, netArch.Sink.y,'o', ...
    'MarkerSize',8, 'MarkerFaceColor', 'y');