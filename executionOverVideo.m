function executionOverVideo()
clc;
%createLearningModel 
bins=9;
% Loads the learned model.
learnedModel = load('learnedModel.mat') ;
learnedModel = learnedModel.learnedModel ;

%videoFReader = VideoReader('Data1.avi');
videoFReader = VideoReader('demo.mp4');

count=0;
%%{
% The system will keep waiting until a person is detected
for i=1:videoFReader.NumberOfFrames
    videoFrame = read(videoFReader,i);
    try
        EyeDetection       
        thresholdratio = ratio*0.95;
        break
    catch exception
        disp('Initializing...');
        pause(0.1);
        %return;
    end
end
disp('----------------------Person is detected-------------------------');
%}

% Create the video player object.
videoPlayer = vision.VideoPlayer;

filename = 'wake.mp3';
[y,Fs] = audioread(filename);
%prepare 2 seconds of samples
samples = [1,2*Fs];
clear y Fs;
[y,Fs] = audioread(filename,samples);
count=0;

i=5;
while i < videoFReader.NumberOfFrames
    videoFrame = read(videoFReader,i);
    imshow(videoFrame);
    pause(0.1);
    title('Video Frame:' + i);
    try
        MouthDetection 
        if lipParams<2
            mouthstatus = 'split';
        else
            mouthstatus='closed';
        end
        eyestatus='closed';
    if strcmp(mouthstatus,'split')
        count=count+1;
        if count>3
            count=0;
            vector = imhist(mouthImage,bins);
            [row column] = size(vector);
            for k=1:bins
                test(1,k)=(vector(k)*100)/(row*column);
            end 
            disp('Computing Heuristics...');
            [labVal,score] = predict(learnedModel,test);
            disp(labVal);
            if(labVal(1,1)==0)
                disp('Learning Model says yes you are sleepy');
                verdict = 'sleepy';
            else
                disp('Learning Model says nope! not sleepy');
                verdict = 'awake';
            end
        end
    else
        verdict = 'awake';
        count=0;
    end
    if strcmp(verdict,'sleepy')
            disp('You are sleepy coz this machine says so.');
            sound(y,Fs);
            count=0;
            pause(0.1)
            i=i+10;
     else
            disp('You are awake');
     end
        
    catch exception
        disp('You are sleepy coz this machine says so.');
        pause(0.1)
        i=i+10;
        verdict = 'awake';
        count=0;
        sound(y,Fs);
        
    end
    i=i+2;
end

release(videoPlayer);

end