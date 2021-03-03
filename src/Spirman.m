function res = Spirman(x,y, H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
   x = [68.8 63.3 75.5 67.2 71.3 72.8 76.5 63.5 69.9 71.4];
   y = [167 113 160 154 151 181 173 115 126 166]; 
   alpha = 0.1;
   H1=1;
end

[x, y]=sameLength(x,y);
n = length(x);

t = rankSpirman(x);
s = rankSpirman(y);

r = 1 - 6/(n*(n^2-1))*sum((t-s).^2);
Z = r*sqrt(n-2)/sqrt(1-r^2);

fprintf('rs = %.3f\n',r);
fprintf('Z = %.3f\n',Z);
invProf(Z,H1, H1*tinv(1-alpha,n-2), tinv(1-alpha/2,n-2));

end