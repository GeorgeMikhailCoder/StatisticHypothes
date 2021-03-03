function res = VilkinsonMannWitny(x1,x2,H1,alpha)
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

x = zeros(1,length(x1)+length(x2));

k1=1;
k2=1;
R1=0;
R2=0;
% Внимание! Если в объединённой выборке повторяются значения больше двух
% раз, нужно менять алгоритм!

for k=1:length(x1)+length(x2)
   if(x1(k1)==x2(k2))
       x(k) = x1(k1);
       x(k+1) = x2(k2);
       
       R1=R1+0.5*(2*k+1);
       R2=R2+0.5*(2*k+1);
       k=k+1;
       k1=k1+1;
       k2=k2+1;
   else
       if(x1(k1)>x2(k2))
           x(k) = x2(k2);
           
           R2 = R2+k;
           k2=k2+1;
       else
           x(k) = x1(k1);
           
           R1 = R1 + k;
           k1=k1+1;
       end
   end
   
   if(k1>n1)
            x(k+1:length(x))=x2(k2:length(x2));
            R2 = R2 + sum(k+1:length(x));
            break;
   else if(k2>n2)
            x(k+1:length(x))=x1(k1:length(x1));
            R1 = R1 + sum(k+1:length(x));
            break;
        end
   end
end

w1 = n1*n2 + n1*(n1+1)/2 - R1;
w2 = n1*n2 + n2*(n2+1)/2 - R2;
W = min(w1,w2);

Z = ( W - n1*n2/2 )/sqrt( n1*n2*(n1 + n2 + 1)/12 );

normProf(Z,H1,alpha);

end