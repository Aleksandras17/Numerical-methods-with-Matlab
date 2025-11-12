%Lotkos ir Volteros modelis
fig1=figure;
fig2=figure;
fig3=figure;
a=2;
b=3;
c=1;
d=2;
y01=1;
y02=2;
T=30;
f1= @(y1,y2) (a-b*y2)*y1;
f2= @(y1,y2) (-c+d*y1)*y2;
C=(['g'; 'b'; 'c'; 'r'; 'm'; 'k'; 'y']);
N=[ 512; 1024; 2048];
for i1=1:length(N)
    % [Y1,Y2] = eul_m_s(N(i1)+1, T, f1, f2, y01, y02);
    %[Y1, Y2] = BDF_s(N(i1)+1, T, f1, f2, y01, y02);
    %[Y1, Y2] = neisr_eul_m_s(N(i1)+1, T, f1, f2, y01, y02);
    [Y1, Y2] = tRKm_s(N(i1)+1, T, f1, f2, y01, y02);
    Int=linspace(0,T,N(i1)+1);
    figure(fig1);
    plot(Int, Y1,C(i1));
    hold on;
    figure(fig2);
    plot(Int,Y2, C(i1));
    hold on;
    figure(fig3);
    plot(Y2, Y1, C(i1));
    hold on;
end


odefun = @(t, y) [f1(y(1), y(2)); f2(y(1), y(2))];
tspan = [0 T];
y0 = [y01; y02];
% [t, y] = ode23(odefun, tspan, y0);
[t, y] = ode15s(odefun, tspan, y0);
figure;
subplot(2, 1, 1);
plot(t, y(:, 1), 'r-');
xlabel('Time');
ylabel('y_1');

subplot(2, 1, 2);
plot(t, y(:, 2), 'b--');
xlabel('Time');
ylabel('y_2');
