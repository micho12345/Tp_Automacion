% Control Cartesiano de Fuerzas
clc
clear all
close all

%% Creación del robot
robotconfig;
Robot = Robot.perturb(0.8);
q0 = [0, 0];
qf = [pi/2, -pi/2];
xf = [1, 1, 0];
T = transl(xf);
q_traj = Robot.ikine(T, 'q0', q0, 'mask',[1, 1, 0, 0, 0, 0]);

%% Parámetros
fd = [10/sqrt(2); 10/sqrt(2)]; % N
Ke = 1000; % N/mm

%% Control
% OS = 4;         % Buscamos sobrepico <= 5%
% xi = -log(OS/100)/sqrt(pi^2 + log(OS/100)^2);
xi = 1;             % Críticamente amortiguado
ts =  0.01;          % Settling time

wn = 4/(xi*ts);
fprintf("wn = %.3f\n", wn)

Kpf = wn^2
Kvf = 2*xi*wn
