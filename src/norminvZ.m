function res = norminvZ(alpha)
if(alpha>0)
    res = norminv(alpha);
else
    res = 1 - norminv(-alpha);
end
end