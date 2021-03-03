function res = VilkinsonMannWitny_2(x1,x2,H1,alpha)
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

x1=sort(x1);
x2=sort(x2);

n1 = length(x1);
n2 = length(x2);

x = sort([x1,x2]);
R1 = sum(rankSpirmanMass(x1,x));
R2 = sum(rankSpirmanMass(x2,x));

w1 = n1*n2 + n1*(n1+1)/2 - R1;
w2 = n1*n2 + n2*(n2+1)/2 - R2;
% w1+w2==n1*n2;
W = min(w1,w2);

Z = (W - n1*n2/2 )/sqrt( n1*n2*(n1 + n2 + 1)/12 );

fprintf('R1 = %d\n',R1);
fprintf('R2 = %d\n',R2);
fprintf('w1 = %d\n',w1);
fprintf('w2 = %d\n',w2);
fprintf('W = %d\n',W);
fprintf('Z = %.3f\n',Z);

normProf(Z,H1,alpha);
end



