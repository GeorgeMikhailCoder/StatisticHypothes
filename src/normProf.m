function res = normProf(Z,H1,alpha)
if(H1 == 0)
    u = norminvZ(1-alpha/2);
    fprintf('G_1-alpha = (%.3f ; %.3f)\n',-u,u);
    if(Z>-u && Z<u) disp('H0 accepted');
    else disp('H0 denied');
    end
else if(H1 == -1)
        u = norminvZ(alpha);
        fprintf('G_1-alpha = (%.3f ; +Inf)\n',u);
        if(Z>u) disp('H0 accepted');
        else disp('H0 denied');
        end
    else % H1 == 1
        u = norminvZ(1-alpha);
        fprintf('G_1-alpha = (-Inf ; %.3f)\n',u);
        if(Z<u) disp('H0 accepted');
        else disp('H0 denied');
        end
    end
end