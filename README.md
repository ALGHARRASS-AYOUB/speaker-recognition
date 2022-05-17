# speaker-recognition
 this project aimed to be used in identifying and detecting the biometric voice of a speaker, using some machine learning algorithms


   MATLAB application for speaker recognition    
   
   

[hint]-you should have matlab 2019 or newer                                                              
1-delete data base for new use use[delete Data.xls] [perfommed in run function]
2-use training function to train your voice
[hint] you can train three voices , for each voice you can train one or more than try. with ID between 1-3.

[+]how to use the matlab project:                                                             
1-double click run file.                                                                        
2-use the trianing m file to train voices, using the command 'training' in matlab workspace.
[.]-record your voice, for five second 
3-use the testing m file to test who is speaking, using the command 'testing' in matlab workspace.
[.]-record your voice, for five second 

[+]-the project created basing on some functions:
trianing: a trianing file which contains :
        
          - record function to record voice for five seconds at frequency of 44100, sampling rate of 16 and by mono channel.
         - Quantify to quantify the input signal of recorded voice.
         - ExtractFeature based on the pitch algorithm in matlab, to extract the pitch feature of the speaker's voice.
         -FilterNoise to Filter the noises and the silence in the signal input.
         - mfcc matlab Algorithm to extract the biometric features of the voice as a signal.
         -WriteData to write output data after processing phase into an excel database.
        
testing: a testing file which contains :

        - record to record by the same function.
         - Quantify to quantify the input signal of recorded voice.
         - ExtractFeature based on the pitch algorithm in matlab, to extract the pitch feature of the speaker's voice.
         -FilterNoise to Filter the noises and the silence in the signal input.
         - mfcc matlab Algorithm to extract the biometric features of the voice as a signal.
         - Converging to calculate the variance between each data from excel database and the tested signal data.
         speakerDetecting use the machine learning KNN algorithm to identify the input data and retreive the speaker features, then identify the speaker.
         
         
         
