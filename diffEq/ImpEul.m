function [Y1, Y2] = neisr_eul_m_s(n, T, f1, f2, y01, y02)
    h=T/n;
    Y1=zeros(n,1);
    Y2=zeros(n,1);
    Y1(1)=y01;
    Y2(1)=y02;
    for i=2:n
        fun = @(vars) [vars(1)-h*f1(vars(1), vars(2))-Y1(i-1); vars(2)-h*f2(vars(1), vars(2))-Y2(i-1)];
        var0=[Y1(i-1), Y2(i-1)];
        options = optimset('Display', 'off', 'TolFun', 1e-10, 'TolX', 1e-10);
        solution = fsolve(fun, var0, options);
        Y1(i)=solution(1);
        Y2(i)=solution(2);
    end  
    return