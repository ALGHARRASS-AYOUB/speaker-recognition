function Features=Converging(Data,CombinedData,coeffs)
%% performming feature scaling for the convergence of the hole data
meanval= mean(CombinedData);
stdval = std(CombinedData,1);
[m,n] = size(Data);

for j=1:n-1
    for i=1:m
        Data(i,j)=(Data(i,j)-meanval(j))/stdval(j); % la variance de la voix � tester et celles de  database
    end
end

[p,q] = size(coeffs);

for j=1:q-1
    for i=1:p
        coeffs(i,j)=(coeffs(i,j)-meanval(j))/stdval(j);% variation du fonctionnalit�es de la voix � tetster
    end
end
Features=coeffs;
end