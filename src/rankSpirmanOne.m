function res = rankSpirmanOne(x,xi)
% ��������� ���� �������� ��� �������� xi � ������� �
eps = 0.01;

ind = find(abs(sort(x)-xi)<eps);
ind = mean(ind);
res =ind;
end