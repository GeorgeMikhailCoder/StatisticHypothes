function [X Y] = sameLength(x,y)
if (length(x)<length(y))
    y=find(y,length(x));
else if(length(x)>length(y))
        x=find(x,length(y));
    end
end
X=x;
Y=y;
end