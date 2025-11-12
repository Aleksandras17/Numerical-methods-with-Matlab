%Istirti tiesines silumos laidumo lygties priklausomybe nuo
%integravimo zingsnio dydzio lambda=1; M=6, 12, 60; palyginti 
%su tiksliu sprend
%ut=uxx, 0<t<T, 0<x<1, u(x,0)=0, 0<x<1, u(t,0)=0, u(t,1)=1, 0<t<T
%pradines salygos\
%lambda=k/h^2
%Parametrai
L=1;%x int
T=1;%Laiko int
M=[6, 12, 60]; %x tasku skaicius
C=(['g'; 'b'; 'c'; 'r'; 'm'; 'k'; 'y']);
for i=1:3
    x=linspace(0, L, M(i)+1);
    h=L/M(i);%erdves zingsnis;
    lambda = 1;
    k = lambda * h^2;%laiko zingsnis
    t = 0:k:T; 
    x_0= @(x) 0;
    t_0= @(t) 0;
    t_end= @(t) 1;
    % u=A_ch_schema2(x, t, x_0, t_0, t_end);
    u=A_ch_schema(x, t, x_0, t_0, t_end);
    [X, T_grid] = meshgrid(x, t);
    u_tikslus = @(x,t) x + 2*sum_series(x, t, 50);
    u_tikslus_vals=u_tikslus(X, T_grid);
    % figure
    % surf(X, T_grid, u_tikslus_vals);
    % figure
    % surf(X, T_grid ,u');
    % disp(u(M(i),:));
    figure;
    surf(X, T_grid, u_tikslus_vals, 'FaceAlpha', 0.5); hold on;
    surf(X, T_grid, u', 'EdgeColor', 'none'); 
    title(['Tikslus vs Skaitmeninis sprendinys (\lambda = ', num2str(lambda), ')']);
    legend('Tikslus', 'Skaitmeninis');
    xlabel('x'); ylabel('t'); zlabel('u(x, t)');
end


function series_sum = sum_series(x, t, N)
    % Tikslus sprendinys - baigtinė sumos išraiška su N terminais
    series_sum = zeros(size(x)); % Inicializuojame
    for k = 1:N
        % term = (-1)^k * (pi*k)^(-1) * exp(-(pi*k)^2* t)*sin(pi*k*x);
        term = (-1)^k*(pi*k)^(-1).*exp(-t*(k*pi)^2).*sin(k.*pi.*x);
        series_sum = series_sum + term;
    end
end