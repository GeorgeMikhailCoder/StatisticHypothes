function res = countRepeat(x,k)
% Если x(k)==x(k+1), подсчитать, сколько ещё в x повторений с k-го элемента
% длина серии
i=k;
while(i<length(x)&&x(i)==x(i+1))    
    i=i+1;
end
res=i-k+1;
end