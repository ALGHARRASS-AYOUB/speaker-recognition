clc;clear all;close all;
fs=44100;
%% Taking speaker ID and voice data for testing
audioSignal=record(fs);
%% defining framesize of samples  to extract features
[windowlength,overlaplength]=Quantify(0.03,0.02,fs);

%% the feature pitch of the first signal input
[feature,location]=ExtractFeature(audioSignal,fs,windowlength,overlaplength);
subplot(4,1,1);plot(audioSignal);ylabel('Amplitude');
subplot(4,1,2);plot(location,feature);ylabel('Pitch (Hz)');xlabel('samples number')

%% Filter the input signal from Noise and Silence
SgFiltered=FilterNoise(audioSignal,windowlength);
% ploting audio after removing nonspeech data 
subplot(4,1,3);plot(SgFiltered);


%% finding Mel-frequency cepstral coefficients (MFCC) for each frame (13 coefficient)

[featureFiltered,locationFiltered]=ExtractFeature(SgFiltered,fs,windowlength,overlaplength);
coeffs = mfcc(SgFiltered,fs,'LogEnergy','Replace');

%% combining pitch and MFCC for getting all feature data in same matrix
[m,n] = size(coeffs);
Features=[coeffs featureFiltered ones(m,1)];

%% reading the training DataBase
Data=xlsread('Data.xls');
CombinedData=[Data; Features];

%% feature scaling for the convergence of the hole data

CvFeatures=Converging(Data,CombinedData,Features);
[p,q] = size(Features);
%% using the KNN (k nearest neighbour) machine learning algorithm to detect exact speaker speaker
ID=speakerDetecting(CvFeatures,Data,m,n,p);
load ListSpeaker
     disp(strcat('speaker- ',num2str(ID),' -->',ListSpeaker(ID)));
     


