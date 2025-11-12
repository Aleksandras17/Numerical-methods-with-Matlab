function xi=jung_grad_m(A, x, f, e)
    p=A*x-f;
    z=p;
    k=1;
    while dot(z,z)>e
        r=A*p;
        T=dot(z,p)/dot(r,p);
        xn=x-T*p;
        zn=z-T*r;
        B=dot(zn,zn)/dot(z,z);
        p=zn+B*p;
        z=zn;
        x=xn;
        xi=transpose(x);
        disp([k, xi]);
        k=k+1;
    end
    return