function res = rankSpirmanMass(x,y)
% ��������� ����� �������� ��� ��������� x �� ������� y
eps = 0.01;

t=zeros(1,length(x));

for i=1:length(x)
    ind = find(abs(y-x(i))<eps);
    ind = mean(ind);
    t(i)=ind;   
end
res =t;
end