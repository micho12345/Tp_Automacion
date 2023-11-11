% Control Cartesiano de Posición
clc
clear all
close all

%% Creación del robot
robotconfig;
% Robot = Robot.perturb(0.8);  % Perturbación

%% Posiciones iniciales y finales
x0 = [1, -1];   % Posición inicial (m)
xf = [1, 1];    % Posición final (m)
tf = 3;         % Tiempo final (s)
tstep = 0.02;   % Timestep (s)

%% Control
% OS = 4;         % Buscamos sobrepico <= 5%
% xi = -log(OS/100)/sqrt(pi^2 + log(OS/100)^2);
xi = 1;             % Críticamente amortiguado
ts =  0.1;          % Settling time

wn = 4/(xi*ts);
fprintf("wn = %.3f\n", wn)

Kp = wn^2*eye(2)
Kv = 2*xi*wn*eye(2)

% %% Test
% x0 = [0.5, 1.5, 0];   % Posición inicial (m)
% xf = [1.5, 0.5, 0];    % Posición final (m)
% t = 0:0.15:3;
% [x, xd, xdd] = jtraj(x0, xf, t);  %Calcula las componentes en cada periodo de tiempo
% T = transl(x);
% q_traj = Robot.ikine(T, 'q0', q0, 'mask',[1, 1, 0, 0, 0, 0])
% Robot.plot(q_traj)
