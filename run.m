
clear all;
disp('-------------------------------------------------------------------------------------');
disp('       MATLAB application for speaker recognition         ');
disp('-------------------------------------------------------------------------------------');
pause(0.2);
disp('[hint]-you should have matlab 2019 or newer');
pause(0.1);
disp('1-delete data base for new use use[delete Data.xls]');
pause(0.1);
disp('2-use training function to train your voice');
pause(0.1);
disp('[hint you can train three voices , for each voice you can train one or more try]');
pause(0.1);
disp('3-use testing function to test your voice');
pause(0.1);
disp('-------------------------------------------------------------------------------------');
delete Data.xls;
delete ListSpeaker.mat;