function startYawnDetection()
clear;
clc;
% Get heuristics and save the data into train and test file.
trainData();
% Learns the data model from the trained set of images and this also saves
% the image into learnedModel.mat file
createLearningModel();
% Executes the learned model on the video.
executionOverVideo();

end