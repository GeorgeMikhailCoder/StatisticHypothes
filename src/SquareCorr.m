function res = SquareCorr(x,y,H1,alpha)
if(nargin==0)
   x = [11.1 14.0 17.1 11.3 11.1 11.5 12.3 13.3 12.3 19.0 16.1 12.5 19.0 16.3 12.1];
   y = [10 17 15 16 11 11 12 13 13 17 12 11 17 13 16 12 14 17 20 16]; 
   H1=0;%всегда, не используется в вычислениях
   alpha = 0.05;
end

if (length(x)<length(y))
    y=find(y,length(x));
else if(length(x)<length(y))
        x=find(x,length(y));
    end
end
n = length(x);

hx = median(x);
hy = median(y);

dxmax = max(x) - hx + 1;
dymax = max(y) - hy + 1;

hold on, grid on
plot(x,y,'or');
line([hx hx],[hy-dymax hy+dymax]);
line([hx-dxmax hx+dxmax],[hy hy]);
plot(x(y==hy), y(y==hy), 'xk')

%Распределяем точки
k13 = sum((x>=hx).*(y>hy));
k24 = sum((x<hx).*(y>hy));

fprintf('n = %d\n',n);
fprintf('alpha = %.2f\n',alpha);
fprintf('hx = %.2f\n',hx);
fprintf('hy = %.2f\n',hy);
fprintf('В первом и третьем квадранте: %d\n',k13);
fprintf('Во втором и четвёртом квадранте: %d\n',k24);

end