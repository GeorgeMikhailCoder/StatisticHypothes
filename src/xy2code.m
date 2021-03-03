function res = xy2code(x,y)
% x - 1
% y - 0


x1=sort(x);
x2=sort(y);

n1 = length(x1);
n2 = length(x2);

xcode = zeros(1,length(x1)+length(x2));
k1=1;
k2=1;
prev=-1;
if(x1(k1)<=x2(k2))prev=1; else prev=0;end;

for k=1:length(x1)+length(x2)
   if(x1(k1)==x2(k2))
       if(prev==1)
            rep = countRepeat(x1,k1)-1;
            xcode(k:k+rep)=1;
            k1=k1+rep;
            k=k+rep;
            
            rep = countRepeat(x2,k2)-1;
            xcode(k:k+rep)=0;
            k2=k2+rep+1;
            k=k+rep;
            
            prev=0;
            
       else
            rep = countRepeat(x2,k2)-1;
            xcode(k:k+rep)=0;
            k2=k2+rep+1;
            k=k+rep;
            
            
            rep = countRepeat(x1,k1)-1;
            xcode(k:k+rep)=1;
            k1=k1+rep+1;
            k=k+rep;          
            
            prev=1;
            
       end
   else
       if(x1(k1)>x2(k2))
            rep = countRepeat(x2,k2)-1;
            xcode(k:k+rep)=0;
            k2=k2+rep+1;
            k=k+rep;
            prev=0;
            
       else
            rep = countRepeat(x1,k1)-1;
            xcode(k:k+rep)=1;
            k1=k1+rep+1;
            k=k+rep;
            prev=1;
            
       end
   end
   
   if(k1>n1) % первый массив закончился
            xcode(k+1:length(x))=0;
            break;
   else if(k2>n2) % второй массив закончился
            xcode(k+1:length(x))=1;
            break;
        end
   end
end
res = xcode;
end