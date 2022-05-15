function data=record(fs)
recorder = audiorecorder(fs, 16, 1);

disp('Please record your voice . . . .');
drawnow();
pause(0.5);
recordblocking(recorder, 5);
play(recorder);
data = getaudiodata(recorder);
end