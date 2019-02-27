function d = calcdiv(nodearchi)

mat = [nodearchi.node(:).region]';
allvalues = unique(mat);
d.numclus = size(allvalues,1);
valuesandnumberofu=[allvalues histc(mat,allvalues)];
d.regaddap = valuesandnumberofu;
%for i=1:allvalues
%d.regaddap(i,1) = valuesandnumberofu(i,1);
%d.regaddap(i,2) = valuesandnumberofu(i,2);
%end

d.mode = mode(d.regaddap(:,2));

end