function res = rankSpirman(x)
% вычисляет ранги элементов для Спирмана
eps = 0.01;

t=zeros(1,length(x));

for i=1:length(x)
    ind = find(abs(sort(x)-x(i))<eps);
    ind = mean(ind);
    t(i)=ind;   
end
res =t;
end