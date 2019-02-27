function d=delsline(a,b)

if ((a(1).XData==b(1).XData )&(a(1).YData==b(1).YData))
    a(1).Visible='off';
    b(1).Visible='off';
   % delete(a(1));
   % delete(b(1));
    1
elseif ((a(1).XData==b(2).XData )&(a(1).YData==b(2).YData))
   % delete(a(1));
    %delete(b(2));
    a(1).Visible='off';
    b(2).Visible='off';
    2
elseif ((a(1).XData==b(3).XData )&(a(1).YData==b(3).YData))
    %delete(a(1));
    %delete(b(3));
    a(1).Visible='off';
    b(3).Visible='off';
    3
elseif ((a(1).XData==b(4).XData )&(a(1).YData==b(4).YData))
   % delete(a(1));
    %delete(b(4));
    a(1).Visible='off';
    b(4).Visible='off';
    4
elseif ((a(2).XData==b(1).XData )&(a(2).YData==b(1).YData))
    %delete(a(2));
    5
   % delete(b(1));
    a(2).Visible='off';
    b(1).Visible='off';
elseif ((a(2).XData==b(2).XData )&(a(2).YData==b(2).YData))
   % delete(a(2));
    6
    %delete(b(2));
    a(2).Visible='off';
    b(2).Visible='off';
elseif ((a(2).XData==b(3).XData )&(a(2).YData==b(3).YData))
    %delete(a(2));
    7
   % delete(b(3));
    a(2).Visible='off';
    b(3).Visible='off';
elseif ((a(2).XData==b(4).XData )&(a(2).YData==b(4).YData))
    8
    
    a(2).Visible='off';
    b(4).Visible='off';
elseif ((a(3).XData==b(1).XData )&(a(3).YData==b(1).YData))
    9
    a(3).Visible='off';
    b(1).Visible='off';
    
    
elseif ((a(3).XData==b(2).XData )&(a(3).YData==b(2).YData))
    10
    a(3).Visible='off';
    b(2).Visible='off';
   % delete(a(3));
    %delete(b(2));
elseif ((a(3).XData==b(3).XData )&(a(3).YData==b(3).YData))
    11
    a(3).Visible='off';
    b(3).Visible='off';
   % delete(a(3));
    %delete(b(3));
elseif ((a(3).XData==b(4).XData )&(a(3).YData==b(4).YData))
    12
    a(3).Visible='off';
    b(4).Visible='off';
   % delete(a(3));
    %delete(b(4));
elseif ((a(4).XData==b(1).XData )&(a(4).YData==b(1).YData))
    13
    a(4).Visible='off';
    b(1).Visible='off';
    %delete(a(4));
    %delete(b(1));
elseif ((a(4).XData==b(2).XData)&(a(4).YData==b(2).YData))
    14
    a(4).Visible='off';
    b(2).Visible='off';
    %delete(a(4));
    %delete(b(2));
elseif ((a(4).XData==b(3).XData )&(a(4).YData==b(3).YData))
    15
    a(4).Visible='off';
    b(3).Visible='off';
    %delete(a(4));
    %delete(b(3));
elseif ((a(4).XData==b(4).XData)&(a(4).YData==b(4).YData))
    16
    a(4).Visible='off';
    b(4).Visible='off';
   % delete(a(4));
   % delete(b(4));
else
end




end