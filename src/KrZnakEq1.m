function res = KrZnakEq1(x1,x2,H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
H1 = -1;
alpha = 0.1;
x1 = [55 52 95 75 80 65 54 63 85 70];
x2 = [57 53 90 78 80 63 55 62 86 72];
end

C12 = x1-x2;
C12(C12==0)=[];
C12
kplus = sum(C12>0);
N=length(C12);

fprintf('kplus = %d\n',kplus);
fprintf('N = %d\n',N);
% 1 способ
if(H1 == 0)
    Zv1 = normcdf( (kplus - N/2 + 1/2)/(sqrt(N)/2)  );
    Zv2 = 1 - normcdf(  (kplus - N/2)/(sqrt(N)/2)  );
    Zv = min(Zv1,Zv2);
    
    fprintf('Zv1 = %.3f\n',Zv1);
    fprintf('Zv2 = %.3f\n',Zv2);
    fprintf('alpha/2 = %d\n',alpha/2);
    
    if(Zv<alpha/2) disp('H0 denied');
    else disp('H0 accepted');
    end
else if(H1 == -1) 
        Zv = normcdf( (kplus - N/2 + 1/2)/(sqrt(N)/2)  );
    else % H1 == 1
        Zv = 1 - normcdf(  (kplus - N/2)/(sqrt(N)/2)  );
    end
    fprintf('Zv = %.3f\n',Zv);
    fprintf('alpha = %d\n',alpha);
    if(Zv<alpha) disp('H0 denied');
    else disp('H0 accepted');
    end
end

end