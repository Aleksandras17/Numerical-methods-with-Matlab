fig1=figure;
fig2=figure;
% fig3=figure;
m=1000;
T=2000;
f1 = @(y1,y2) y2;
f2= @(y1,y2) m*(1-y1.^2)*y2-y1;
C=(['g'; 'b'; 'c'; 'r'; 'm'; 'k'; 'y']);
N=[ 2048; 4096];
p=1000;
for i1=1:length(N)
    h=T/(N(i1)+1);
    y01=1;
    y02=0;
    for i=1:p
        [Y1, Y2]=BDF_s(N(i1)+1, T/p, f1, f2, y01, y02);
        figure(fig1)
        Int=linspace((i-1)*T/p,i*T/p,N(i1)+1);
        plot(Int, Y1,C(i1));
        hold on;
        y01=Y1(N(i1)+1);
        y02=Y2(N(i1)+1);
    end
    %[Y1,Y2]= eul_m_s(N(i1)+1, T, f1, f2, y01, y02);
    %[Y1,Y2]=neisr_eul_m_s(N(i1)+1, T, f1, f2, y01, y02);
    %[Y1,Y2]=tRKm_s(N(i1), T, f1, f2, y01, y02);
    % figure(fig1)
    % Int=linspace(0,T,N(i1)+1);
    % plot(Int, Y1,C(i1));
    % hold on;
    % figure(fig2);
    % plot(Int,Y2, C(i1));
    % hold on;
end
odefun = @(t, y) [y(2); m * (1 - y(1)^2) * y(2) - y(1)];
tspan=[0;T];
y0=[1; 0];
[t,y] = ode15s(odefun, tspan, y0);
figure;
subplot(2, 1, 1);
plot(t, y(:, 1), 'r-');
xlabel('Time');
ylabel('y_1');
title('Van der Pol Equation: Solution for y_1');

subplot(2, 1, 2);
plot(t, y(:, 2), 'b--');
xlabel('Time');
ylabel('y_2');
title('Van der Pol Equation: Solution for y_2');