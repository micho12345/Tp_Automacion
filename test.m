clc
clear all
close all

%el ultimo, si es 1 es prismatico, 0 si es rotatorio
L(1) = Link([0, 0, 1, 0, 0]);
L(2) = Link([0, 0, 1, 0, 0]);


% Definir los vértices del polígono que representa la pared
xVertices = [2, 0, 0, 2];
yVertices = [0, 2, 2, 0];
zVertices = [2, 2, 0, 0]; % Todos los vértices tienen una coordenada z de 0
fill3(xVertices, yVertices, zVertices, 'b'); % 'b' para color azul

%L(2).qlim = [0 500];   si es prismatico tengo que poner un limite
%L(2).offset = pi/2;

KR = SerialLink(L)

%MATRIZ T
qf = [pi/2 0];  %Pos final, lo que rotan cada joint para la posicion final
Tf = KR.fkine(qf);     %matriz Tf

q0 = [0 0];     %pos inicial
q = KR.ikine(Tf, q0, 'mask', [1 1 0 0 0 0]); %Cinematica Inversa  ---> lo ultimo son los grados de libertad

KR.name = 'Pacho Norras';   %Nombre del robot

J = jacobe(KR, q);      %Jacobiano

%PLOT DE TRAYECTORIA
t = 0:0.15:3;
Q = jtraj(q0,qf,t);  %Calcula las componentes en cada periodo de tiempo
Tr = fkine(KR, Q);  %Trayectoria del END EFFECTOR

for i = 1:1:length(t)
    T = Tr(i);
    trs = transl(T);  %TRANSLACION
    xx(i) = trs(1);   %Cada uno en x y z
    yy(i) = trs(2);
    zz(i) = trs(3);
end

plot(KR,Q);    %imprimo brazo
hold on
plot3(xx,yy,zz,'Color',[1 0 0], 'LineWidth', 2);

KR.teach(q0)
