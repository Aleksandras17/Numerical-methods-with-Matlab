function u = A_ch_schema(x, t, x_0, t_0, t_n)
%4 Tasku neisreikstinis
    nx = length(x);
    nt = length(t);
    u = zeros(nx, nt);
    h = 1/nx;
    k = 1/nt;
    s = k/(h^2);
    u(:, 1) = x_0(x);
    u(nx, 1) =t_n(0);
    u(1, 1) = t_0(0);
    A=diag((1+2*s)*ones(1,nx))+diag(-s*ones(1,nx-1),-1)+diag(-s*ones(1,nx-1),+1);
    disp(A);
    for i=1:nt-1
        b=u(:,i);
        b(1)=b(1)+s*t_0(i);
        b(end)=b(end)+s*t_n(i);
        u_new=A\b;
        u(:,i+1)=u_new;
        u(1, i+1)=t_0(i);
        u(end,i+1)=t_n(i);
    end