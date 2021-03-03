function res = BinRaspred(n,min_i,max_i)
sum=0;
for i=min_i:max_i
    sum=sum+ factorial(n)./(factorial(i).*factorial(n-i));
end
res = 2.^(-n).*sum;