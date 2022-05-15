
%%
clc;close all;
fs=44100;
%% Taking speaker ID and voice data for training
speaker = input('Enter speaker id:');
speakerName = input('Enter speaker name:','s');
try 
    ListSpeaker(end+1)={speakerName};
catch
     ListSpeaker = {};
     ListSpeaker(1)={speakerName};
end
save ListSpeaker
audioSignal=record(fs);

%% defining framesize of samples [Quantification]
[windowlength,overlaplength]=Quantify(0.03,0.02,fs);
%% the feature pitch of the first signal input
[feature,location]=ExtractFeature(audioSignal,fs,windowlength,overlaplength);
subplot(4,1,1);plot(audioSignal);ylabel('Amplitude')
subplot(4,1,2);plot(location,feature);ylabel('Pitch (Hz)');xlabel('samples number')

%% Filter the input signal from Noise and Silence
SgFiltered=FilterNoise(audioSignal,windowlength);
% ploting audio after removing nonspeech data 
subplot(4,1,3);plot(SgFiltered);


%%  the feature pitch of the Filtered signal input [Harmonic signal]
[FilteredFeature,FilteredFeaturelocation]=ExtractFeature(SgFiltered,fs,windowlength,overlaplength);
subplot(4,1,4); plot(FilteredFeaturelocation,FilteredFeature);ylabel('Pitch (Hz)');xlabel('Sample Number')

%% finding Mel-frequency cepstral coefficients (MFCC) for each frame (13 coefficient)

MfccCoffsFeatures = mfcc(SgFiltered,fs,'LogEnergy','Replace');
[m,n] = size(MfccCoffsFeatures);
SpeakerFeatures=[MfccCoffsFeatures FilteredFeature ones(m,1)*speaker];
%appending pitch with MFCC, to get 14 features together
%%
%Save the information into the DataBase 
writeData('Data.xls',SpeakerFeatures)

