function res = rankSpirmanOne(x,xi)
% вычисляет ранг Спирмана для элемента xi в массиве х
eps = 0.01;

ind = find(abs(sort(x)-xi)<eps);
ind = mean(ind);
res =ind;
end