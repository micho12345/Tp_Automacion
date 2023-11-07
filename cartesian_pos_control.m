% Control Cartesiano de Posición
clc
clear all
close all

%% Creación del robot
robotconfig;

%% Posiciones iniciales y finales
x0 = [1, -1];   % Posición inicial (m)
xf = [1, 1];    % Posición final (m)
tf = 3;         % Tiempo final (s)
tstep = 0.02;   % Timestep (s)

% %% Control
% OS = 4;         % Buscamos sobrepico <= 5%
% xi = -log(OS/100)/sqrt(pi^2 + log(OS/100)^2);
% ts = 0.25;         % Settling time
% wn = 4/(xi*ts);
% fprintf("wn = %.3f\n", wn)
% 
% Kp = wn^2*eye(2)
% Kv = 2*sqrt(Kp)*eye(2)

% %% Polos
% disp('Polos')
% p1 = - xi*wn + 1i*wn*sqrt(1-xi^2);
% fprintf("p1 = %.3f%+.3fj\n", real(p1), imag(p1))
% p2 = - xi*wn - 1i*wn*sqrt(1-xi^2);
% fprintf("p2 = %.3f%+.3fj\n\n", real(p2), imag(p2))
% 
% %% Armo transferencia
% syms s;
% num = wn^2;
% den = coeffs((s-p1)*(s-p2));
% 
% %% Resuelvo Ks
% syms k1
% syms k2
% % Condición 1: Ganancia 1
% k1 = double(solve(num == den(1), k1))
% 
% % Condición 2: OS% <= 5%
% k2 = double(solve(2*xi*double(sqrt(wn)) == den(2), k2))


% %% Test
% x0 = [1, -1, 0];
% xf = [1, 1, 0];
% t = 0:0.15:3;
% [x, xd, xdd] = jtraj(x0, xf, t);  %Calcula las componentes en cada periodo de tiempo
% T = transl(x);
% q_traj = Robot.ikine(T, 'q0', q0, 'mask',[1, 1, 0, 0, 0, 0])
% Robot.plot(q_traj)
