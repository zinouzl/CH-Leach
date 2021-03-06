
function createfigure(X1, Y1, Y2, Y3)
%CREATEFIGURE(X1,Y1,Y2,Y3)
%  X1:  vector of x data
%  Y1:  vector of y data
%  Y2:  vector of y data
%  Y3:  vector of y data

%  Auto-generated by MATLAB on 31-Jan-2013 18:49:05

% Create figure
figure1 = figure(2);

% Create sub-plot
subplot1 = subplot(1,3,3,'Parent',figure1);
box(subplot1,'on');
hold(subplot1,'all');

% Create plot
plot(X1,Y1,'Parent',subplot1,'LineWidth',2,'Color',[0 1 0]);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',11,'FontName','Cambria');

% Create y-label
ylabel('sum of energy','FontWeight','bold','FontSize',11,...
    'FontName','Cambria');

% Create title
title('Sum of energy of nodes vs. round','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');

% Create sub-plot
subplot2 = subplot(1,3,1,'Parent',figure1);
box(subplot2,'on');
hold(subplot2,'all');

% Create plot
plot(X1,Y2,'Parent',subplot2,'LineWidth',2);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',11,'FontName','Cambria');

% Create y-label
ylabel('# of packets sent to BS nodes','FontWeight','bold','FontSize',11,...
    'FontName','Cambria');

% Create title
title('Number of packet sent to BS vs. round','FontWeight','bold',...
    'FontSize',12,...
    'FontName','Cambria');

% Create sub-plot
subplot3 = subplot(1,3,2,'Parent',figure1);
box(subplot3,'on');
hold(subplot3,'all');

% Create plot
plot(X1,Y3,'Parent',subplot3,'LineWidth',2,'Color',[1 0 0]);

% Create x-label
xlabel('Round','FontWeight','bold','FontSize',11,'FontName','Cambria');

% Create y-label
ylabel('# of dead nodes','FontWeight','bold','FontSize',11,...
    'FontName','Cambria');

% Create title
title('Number of dead node vs. round','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');

