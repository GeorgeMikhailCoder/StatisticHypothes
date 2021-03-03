function res = LinearContrast(xmass,cmass,H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
    xmass = {[1 3 2 1 0 2 1];
             [2 3 2 1 4]; 
             [4 5 3]};
    
    cmass = [1 -1 0];
    H1=0;
    alpha=0.05;
end

kX = length(xmass);

n=0;
sumVerh=0;
sumNiz=0;
Qeps = 0;
for k=1:kX
    ck=cmass(k);
    xk = xmass{k};
    srXk = mean(xk);
    nk = length(xk);
    
    n = n+nk;
    sumVerh = sumVerh + ck*srXk;
    sumNiz = sumNiz + ck^2/nk;
    Qeps = Qeps + sum((xk-srXk).^2);
end
Seps = Qeps/(n-kX);
T = sumVerh/(Seps*sqrt(sumNiz));

fprintf('T = %.3f\n',T);
invProf(T,H1,tinv(1-alpha,n-kX),tinv(1-alpha/2,n-kX));
end