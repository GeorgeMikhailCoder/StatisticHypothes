function res = KrZnakEq0(x1,x2,H1,alpha)
% ������������ �1:
% -1 - ������
% 0 - �� �����
% 1 - ������
if(nargin==0)
H1 = -1;
alpha = 0.1;
x1 = [55 52 95 75 80 65 54 63 85 70];
x2 = [57 53 90 78 80 63 55 62 86 72];
end


C12 = x1-x2;
C12(C12==0)=[];
kplus = sum(C12>0);
N=length(C12);

fprintf('kplus = %d\n',kplus);
% 1 ������
if(H1 == 0)
    Zv1 = BinRaspred(N,0,kplus);
    Zv2 = BinRaspred(N,kplus,N);
    Zv = min(Zv1,Zv2);
    
    fprintf('Zv1 = %.3f\n',Zv1);
    fprintf('Zv2 = %.3f\n',Zv2);
    fprintf('alpha/2 = %d\n',alpha/2);    
    
    if(Zv<alpha/2) disp('H0 denied');
    else disp('H0 accepted');
    end
else if(H1 == -1)
        Zv = BinRaspred(N,0,kplus);
    else % H1 == 1
        Zv = BinRaspred(N,kplus,N);
    end
    fprintf('Zv = %.3f\n',Zv);
    fprintf('alpha = %d\n',alpha);
    if(Zv<alpha) disp('H0 denied');
    else disp('H0 accepted');
    end
end


    
    
    
    
end