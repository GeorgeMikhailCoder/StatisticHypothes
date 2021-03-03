function res = invProf(Z,H1, z_a, z_a2)
if(H1 == 0)
    u = z_a2;
    fprintf('G_1-alpha = (%.3f ; %.3f)\n',-u,u);
    if(Z>-u && Z<u) disp('H0 accepted');
    else disp('H0 denied');
    end
else if(H1 == -1)
        u = z_a;
        fprintf('G_1-alpha = (%.3f ; +Inf)\n',u);
        if(Z>u) disp('H0 accepted');
        else disp('H0 denied');
        end
    else % H1 == 1
        u = z_a;
        fprintf('G_1-alpha = (-Inf ; %.3f)\n',u);
        if(Z<u) disp('H0 accepted');
        else disp('H0 denied');
        end
    end
end