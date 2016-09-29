Mode=2;

%%Reduced Run
if Mode==1
clear all;
Mode=1
loading;
Clustering;
Thresholding;
test_reduced
end

%%Expanded Run
if Mode==2
clear all;
Mode=2;
loadinge;
ClusteringH;
HistogramH;
test_expanded
end