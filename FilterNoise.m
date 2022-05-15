function OutputSignal=FilterNoise(audioSignal,windowlength)
    
totalframe=floor(length(audioSignal)/windowlength);
averagePower=zeros(totalframe,1);
frame=zeros(windowlength,1);
audioSignal2= zeros(length(audioSignal),1);

%% filtered audio haute frequencies, 
for j=1:totalframe
   a=((j-1)*windowlength)+1;
   b=j*windowlength;
   frame=audioSignal(a:b,1);
   framesq=frame.^2;
   averagePower(j,1)=sum(framesq)/windowlength;
   if averagePower(j,1)> 1e-4
    audioSignal2(a:b,1)=frame;
   end
end

SgFiltered=[];
c=0;
%% filter Silence from input Audio
for j=1:length(audioSignal2)
if audioSignal2(j,1)==0
    c=c+1;
    if c>50
        continue;
    end
end

SgFiltered = [SgFiltered; audioSignal2(j,1)]; % matrice de SgFiltered
if audioSignal2(j,1) ~=0
    c=0;
end
end
OutputSignal=SgFiltered;
end