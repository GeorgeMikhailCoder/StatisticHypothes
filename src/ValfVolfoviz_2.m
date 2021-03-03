function res = ValfVolfoviz_2(x1,x2,H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
H1 = 0;
alpha = 0.1;
x1 = [31 26 33 11 13 5 18 1 2 16 17 23 20 21 9];
x2 = [12 7 4 8 3 6 10 25 22 24 15 19 14 36 34 32 27 29 30 35 28];
end

n1 = length(x1);
n2 = length(x2);

xcode = xy2code(x1,x2);
N = countSeries(xcode);
Z = (abs(N - (2*n1*n2/(n1+n2) + 1)) - 1/2)/...
    sqrt( (2*n1*n2*(2*n1*n2-n1-n2))/(((n1+n2)^2)*(n1+n2-1)) );
fprintf('N = %i\n',N);
fprintf('Z vibor = %.3f\n',Z);

normProf(Z,H1,alpha);

end