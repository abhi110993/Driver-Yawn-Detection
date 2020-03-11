function [ trainVector, trainLabel ] = trainData()
bins=9;
for k=1:18
file = strcat('P1/',num2str(k));
file = strcat(file,'.jpg');
img = imread(file);
local=imhist(img,bins);
[row column] = size(img);

for i=1:bins
    trainVector(k,i)=(local(i)*100)/(row*column);
end
    trainLabel(k)=0;
end
l=1;
for k=19:78
file = strcat('N1/',num2str(l));
l=l+1;
file = strcat(file,'.jpg');
img = imread(file);
local=imhist(img,bins);
[row column] = size(img);
for i=1:bins
    trainVector(k,i)=(local(i)*100)/(row*column);
    trainLabel(k)=1;
end 
end
trainLabel=trainLabel';
save trainVector trainVector ;
save trainLabel trainLabel;
%%{
save testVector trainVector ;
save testLabel trainLabel;
%}
end