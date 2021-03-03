function res = KrZnakEq2(x1,x2,H1,alpha)
% Альтернатива Н1:
% -1 - меньше
% 0 - не равно
% 1 - больше
if(nargin==0)
H1 = 0;
alpha = 0.1;
x1 = [55 52 95 75 80 65 54 63 85 70];
x2 = [57 53 90 78 80 63 55 62 86 72];
end


C12 = x1-x2;
C12(C12==0)=[];
kplus = sum(C12>0);
n=length(C12);

r = kplus;

fprintf('kplus = %d\n',kplus);
if(H1 == 0)
    Zv1 = (n-r)/(r+1);
    F1 = finv(1-alpha/2, 2*(r+1), 2*(n-r) );
    Zv2 = r/(n-r+1);
    F2 = finv(1-alpha/2, 2*(n-r+1), 2*r);
    
    fprintf('Z1_vibor = %.3f\n',Zv1);
    fprintf('F1 = %.3f\n',F1);
    fprintf('Z2_vibor = %.3f\n',Zv2);
    fprintf('F2 = %.3f\n',F2);
    
    
    if(Zv1>=F1 || Zv2>= F2) disp('H0 denied');
    else disp('H0 accepted');
    end   
else if(H1 == -1)
        Zv = (n-r)/(r+1);
        F = finv(1-alpha, 2*(r+1), 2*(n-r) );
        
        fprintf('Z_vibor = %.3f\n',Zv);
        fprintf('F = %.3f\n',F);
        
        if(Zv>=F) disp('H0 denied');
        else disp('H0 accepted');
        end
    else % H1 == 1
        Zv = r/(n-r+1);
        F = finv(1-alpha,2*(n-r+1),2*r);
        
        fprintf('Z_vibor = %.3f\n',Zv);
        fprintf('F = %.3f\n',F);
        
        if(Zv>=F) disp('H0 denied');
        else disp('H0 accepted');
        end
    end

end  
    
end