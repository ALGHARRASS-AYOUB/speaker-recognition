function writeData(filename,SpeakerFeatures)

try
    pastData=xlsread(filename);
    newData=[pastData; SpeakerFeatures];  
    xlswrite(filename,newData);
catch
    xlswrite(filename,SpeakerFeatures);
end


end