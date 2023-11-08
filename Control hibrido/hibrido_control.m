% Control Cartesiano de Posici�n
clc
clear all
close all

%% Creaci�n del robot
robotconfig;
% Robot = Robot.perturb(0.8);  % Perturbaci�n

%% Posiciones iniciales y finales
x0 = [0.5, 1.5];   % Posici�n inicial (m)
xf = [1.5, 0.5];    % Posici�n final (m)
q0 = [0.5899213, 1.3180727];
tf = 3;         % Tiempo final (s)
tstep = 0.2;   % Timestep (s)

%% Par�metros
fd = [10/sqrt(2); 10/sqrt(2)]; % N
Ke = 1000; % N/mm

%% Control
xi = 1;             % Cr�ticamente amortiguado
ts_c =  0.1;          % Settling time
ts_f =  0.001;          % Settling time

wn_c = 4/(xi*ts_c);
fprintf("wn_c = %.3f\n", wn_c)

wn_f = 4/(xi*ts_f);
fprintf("wn_f = %.3f\n", wn_f)


Kp = wn_c^2*eye(2);
Kv = 2*xi*wn_c*eye(2);

Kpf = wn_f^2;
Kvf = 2*xi*wn_f;





