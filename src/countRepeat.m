function res = countRepeat(x,k)
% ���� x(k)==x(k+1), ����������, ������� ��� � x ���������� � k-�� ��������
% ����� �����
i=k;
while(i<length(x)&&x(i)==x(i+1))    
    i=i+1;
end
res=i-k+1;
end