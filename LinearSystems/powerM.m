function [l,x]=laipsniu_m(A, x0, e)
x0=x0/norm(x0);
y=A*x0;
x=y/norm(y);
l0=dot(y,x0);
k=1;
disp([k, l0, transpose(x)]);
if norm(x-x0)<e
    l=l0;
    return
end
while norm(x-x0)>e
    x0=x;
    y=A*x0;
    x=y/norm(y);
    l=dot(y,x);
    if abs(l-l0)<e
        break
    end
    l0=l;
    k=k+1;
    disp([k, l, transpose(x)]);
    disp(norm(x-x0));
end
return;