function ID=speakerDetecting(CvFeatures,Data, m,n,p)
%% using the KNN (k nearest neighbour) machine learning algorithm to detect exact speaker speaker

SqaureDist=zeros(m,n-1,p);

for k=1:p
   for j=1:n-1
       for i=1:m
           SqaureDist(i,j,k)=(CvFeatures(k,j)-Data(i,j))^2; % less square Distance ==> good recognition
       end
   end
end

sumval=zeros(m,p);

for k=1:p
    for i=1:m
       sumval(i,k)=sum(SqaureDist(i,:,k));
    end
end

kval=10;           
[b,ind] = mink(sumval,kval);

[u,v]=size(ind);

result=zeros(1,v);
resultmtx=zeros(u,v);

for j=1:v
    
    speaker1=0; 
    speaker2=0; 
    speaker3=0; 
    
    for i=1:u
        indx=ind(i,j);
        resultmtx(i,j)= Data(indx,15);
        if Data(indx,15)==1
            speaker1=speaker1+1;
        elseif Data(indx,15)==2
                speaker2=speaker2+1;
        elseif Data(indx,15)==3
                speaker3=speaker3+1;
                
        end
    end
    
    if speaker1>speaker2
        if speaker1>speaker3
            result(1,j)=1;
        else
            result(1,j)=3;
        end
        
    elseif speaker2>speaker3
        result(1,j)=2;
    else 
        result(1,j)=3;
    end
end
        
 ID=mode(result);           
     
end