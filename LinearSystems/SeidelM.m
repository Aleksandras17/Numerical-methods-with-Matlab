function X=zeidelio_m(A, b, x0, n, e)
X=zeros(n,1);
for i1=1:n
    X(i1)=b(i1)/A(i1,i1);
    for i2=1:i1-1
        X(i1)=X(i1)-(X(i2)*A(i1,i2))/A(i1,i1);
    end
    for i2=i1+1:n
        X(i1)=X(i1)-(x0(i2)*A(i1,i2))/A(i1,i1);
    end
end
xi=zeros(1,n);
for i=1:n
    xi(1,i)=X(i);
end
disp([1, xi]);
k=2;
while norm(X-x0,inf)>e
    x0=X;
    for i1=1:n
        X(i1)=b(i1)/A(i1,i1);
        for i2=1:i1-1
            X(i1)=X(i1)-(X(i2)*A(i1,i2))/A(i1,i1);
        end
        for i2=i1+1:n
            X(i1)=X(i1)-(x0(i2)*A(i1,i2))/A(i1,i1);
        end
    end
    for i=1:n
        xi(1,i)=X(i);
    end
    disp([k,xi]);
    k=k+1;
end
disp(X);
