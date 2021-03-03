function res = countSeries(x)

N = 0;
i=1;
while(i<=length(x))
    k=countRepeat(x,i);
    N=N+1;
    i=i+k;
end
res=N;
end