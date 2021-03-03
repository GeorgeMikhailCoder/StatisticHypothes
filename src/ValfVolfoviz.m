function res = ValfVolfoviz(x1,x2,H1,alpha)
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

xcode = zeros(1,length(x1)+length(x2));
x = zeros(1,length(x1)+length(x2));

k1=1;
k2=1;
N=0;
prev=-1;
if(x1(k1)<=x2(k2))prev=0; else prev=1;end;

for k=1:length(x1)+length(x2)
   if(x1(k1)==x2(k2))
       xcode(k) = prev;
       xcode(k+1) = ~prev;
       x(k) = x1(k1);
       x(k+1) = x2(k2);
       
       k=k+1;
       k1=k1+1;
       k2=k2+1;
       N=N+1;
   else
       if(x1(k1)>x2(k2))
           x(k) = x2(k2);
           xcode(k) = 0;
           
           k2=k2+1;
           if(prev==1)
               N=N+1;
               prev=0;
           end
       else
           x(k) = x1(k1);
           xcode(k) = 1;
           
           k1=k1+1;
           if(prev==0)
               N=N+1;
               prev=1;
           end
       end
   end
   
   if(k1>n1)
            x(k+1:length(x))=x2(k2:length(x2));
            xcode(k+1:length(x))=0;
            if(prev==1) N=N+1; end
            break;
   else if(k2>n2)
            x(k+1:length(x))=x1(k1:length(x1));
            xcode(k+1:length(x))=1;
            if(prev==0) N=N+1; end
            break;
        end
   end
end
% fprintf('xcode = \n');
% disp(xcode(k-3:length(xcode)));
% fprintf('k = %d, k1 = %d, k2 = %d, n1 = %d, n2 = %d\n',k,k1,k2,n1,n2);

Z = (abs(N - (2*n1*n2/(n1+n2) + 1)) - 1/2)/...
    sqrt( (2*n1*n2*(2*n1*n2-n1-n2))/(((n1+n2)^2)*(n1+n2-1)) );
fprintf('N = %i\n',N);
fprintf('Z vibor = %.3f\n',Z);

normProf(Z,H1,alpha);

end