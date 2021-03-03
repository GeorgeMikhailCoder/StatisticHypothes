function res = Kendal(x,y,H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
%    x = [11.1 14.0 17.1 11.3 11.1 11.5 12.3 13.3 12.3 19.0 16.1 12.5 19.0 16.3 12.1];
%    y = [10 17 15 16 11 11 12 13 13 17 12 11 17 13 16 12 14 17 20 16]; 
   x = [68.8 63.3 75.5 67.2 71.3 72.8 76.5 63.5 69.9 71.4];
   y = [167 113 160 154 151 181 173 115 126 166]; 
   alpha = 0.1;
   H1=0;
end

[x, y]=sameLength(x,y);
n = length(x);
[B I]=sort(x);
y = y(I);

k = countInverse(y);

tau = 1 - 4*k/(n*(n-1));
Z = sqrt( (9*n*(n + 1)) / (2*(2*n+5)) )*tau;

fprintf('k = %d\n',k);
fprintf('tau = %.3f\n',tau);
fprintf('Z = %.3f\n',Z);
normProf(Z,H1,alpha);

end