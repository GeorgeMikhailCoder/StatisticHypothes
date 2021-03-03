function res = countInverse(x)
% äëÿ Êåíäàëà
k=0;
for i=1:length(x)
    for j=i:length(x)
        if(x(i)>x(j))
            k=k+1;
        end
    end
end
res=k;
end

