function [windowlength,overlaplength]=Quantify(t1,t2,fs)
windowlength = round(t1*fs); % window length for each  30ms
overlaplength = round(t2*fs); % 20ms
% the tride between each frame of Quantification
tride = windowlength - overlaplength; 
end