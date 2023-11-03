%% Creamos el robot
clc
clear all
close all

%% Definimos características
N = 2; % Cantidad de links
% Tipos de link
type = {'revolute', 'revolute'};
% Longitudes
L = [1, 1];
% Masas
M = [1, 1]; % Masa unitaria
% Momentos de inercia
I = {0*eye(3), 0*eye(3)};  % Masa concentrada
% Centros de masa
R = {[L(1),0,0],[L(2),0,0]}; % Concentrada al final del link
% Fricción
B = [1, 1]; % Fricción unitaria

% Parametros DH
DH = struct('d', cell(1,N), 'a', cell(1,N), 'alpha', cell(1,N), 'theta', cell(1,N));
DH(1).d = 0; DH(1).a = 0; DH(1).alpha = 0;
DH(2).d = 0; DH(2).a = L(1); DH(2).alpha = 0;

%% Creación de Links
for i = 1:N
    links{i} = Link(type{i}, 'modified', 'd', DH(i).d, 'a', DH(i).a, 'alpha', DH(i).alpha, ...
        'I', I{i}, 'r', R{i}, 'm', M(i), 'B', B(i)); % Vector de estructuras Link
end

%% Creación del Robot
Robot = SerialLink([links{:}], 'tool', transl([L(2), 0, 0]), 'name', 'Pacho Norras');

% Test
q0 = [0 -pi/2]; % Posicion inicial
qf = [0 pi/2];
Robot.teach(q0)
