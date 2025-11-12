function [Y1,Y2] = tRKm_s(n, T, f1, f2, y01, y02)
    h=T/n;
    Y1=zeros(n,1);
    Y2=zeros(n,1);
    Y1(1)=y01;
    Y2(1)=y02;
    for i = 2:n
        k11=f1(Y1(i-1), Y2(i-1));
        k12=f2(Y1(i-1), Y2(i-1));
        k21=f1(Y1(i-1)+(h/2)*k11, Y2(i-1)+(h/2)*k12);
        k22=f2(Y1(i-1)+(h/2)*k11, Y2(i-1)+(h/2)*k12);
        k31=f1(Y1(i-1)+h*(2*k21-k11), Y2(i-1)+h*(2*k22-k12));
        k32=f2(Y1(i-1)+h*(2*k21-k11), Y2(i-1)+h*(2*k22-k12));
        Y1(i)=Y1(i-1)+(h/6)*(k11+4*k21+k31);
        Y2(i)=Y2(i-1)+(h/6)*(k12+4*k22+k32);
    end
    return
