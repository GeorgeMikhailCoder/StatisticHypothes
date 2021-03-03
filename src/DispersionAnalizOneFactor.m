function res = DispersionAnalizOneFactor(xmass,alpha)
% x - массив €чеек!
if(nargin==0)
    xmass = {[1 3 2 1 0 2 1];
             [2 3 2 1 4]; 
             [4 5 3]};
    alpha=0.05;
end


kX = length(xmass);

n=0;
sumX=0;
for k=1:kX
    xk = xmass{k};
    nk=length(xk);
    
    n = n+nk;
    sumX = sumX + sum(xk);
end
srX = sumX/n;

Qeps = 0;
QA = 0;
for k=1:kX
    xk = xmass{k};
    srXk = mean(xk);
    
    Qeps = Qeps + sum((xk-srXk).^2);
    QA = QA + length(xk)*(srXk-srX).^2;
end
Fv = ( QA/(kX-1) )/( Qeps/(n-kX) );
Fkvant = finv(1-alpha,kX-1,n-kX);

fprintf('n = %.3f\n',n);
fprintf('QA = %.3f\n',QA);
fprintf('Qeps = %.3f\n',Qeps);
fprintf('Fv = %.3f\n',Fv);
fprintf('Fkvant = %.3f\n',Fkvant);
fprintf('G_1-alpha = (0 ; %.3f)\n',Fkvant);

if( Fv > Fkvant ) 
    disp('H0 denied');
else
    disp('H0 accepted');
    m  = srX;
    sigma = sqrt(Qeps/(n-kX));
    fprintf('m = %.3f\n',m);
    fprintf('sigma = %.3f\n',sigma);
end

