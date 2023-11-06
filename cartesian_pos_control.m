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

% %% Test
% x0 = [1, -1, 0];
% xf = [1, 1, 0];
% t = 0:0.15:3;
% [x, xd, xdd] = jtraj(x0, xf, t);  %Calcula las componentes en cada periodo de tiempo
% T = transl(x);
% q_traj = Robot.ikine(T, 'q0', q0, 'mask',[1, 1, 0, 0, 0, 0])
% Robot.plot(q_traj)
