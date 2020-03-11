%function createLearningModel()

clear all
close all
clc

testVector = load('testVector.mat');
testVector = testVector.trainVector;

testLabel = load('testLabel.mat');
testLabel = testLabel.trainLabel;

trainVector = load('trainVector.mat');
trainVector = trainVector.trainVector ;

trainLabel = load('trainLabel.mat');
trainLabel =trainLabel.trainLabel;
%TestY
%TrainX



% c = cvpartition(200,'KFold',10);
% opts = {};
% SVMModel = fitcsvm(X,labels,'KernelFunction','rbf','OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',opts)
% CVSVMModel = crossval(SVMModel);
% [label,score] = kfoldPredict(CVSVMModel);

learnedModel = fitcensemble(trainVector,trainLabel);
[output,score] = predict(learnedModel,testVector);

% Mdl = TreeBagger(13,TrainX,TrainY)
% [label,score] = predict(Mdl,TestX);

sum=0;
for i=1:size(testLabel)
    if(output(i,1)==testLabel(i,1))
        sum = sum + 1;
    end
    
end
%sum/length(testLabel)
%output
%testLabel
%save learnedModel learnedModel ;
%end