
im1=videoFrame;

awakeprob = [100 85 50 15];

randomnumber = rand(1)*100;

if strcmp(eyestatus ,'open')&&strcmp(mouthstatus,'closing')
    if randomnumber <= 100 %awakeprob(1)
        verdict = 'awake';
    else
        verdict = 'sleepy';
    end   
elseif strcmp(eyestatus ,'open')&&strcmp(mouthstatus,'split')
    if randomnumber <= 85%awakeprob(2)
        verdict = 'awake';
    else
        verdict = 'sleepy';
    end
elseif strcmp(eyestatus ,'closed')&&strcmp(mouthstatus,'closing')
    if randomnumber <= 50%awakeprob(3)
        verdict = 'awake';
    else
        verdict = 'sleepy';
    end
else
     if randomnumber <= 15%awakeprob(4)
        verdict = 'awake';
    else
        verdict = 'sleepy';
     end
end

pause(1)