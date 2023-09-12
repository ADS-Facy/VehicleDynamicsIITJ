%% Vehicle dynamics- Cruise Control

clc
clear

m = 1505; %BMW 220i msport mass 
b = 50;
u = 50;

A = -b/m;
B = 1/m;
C = 1;
D = 0;

cruise_ss = ss(A,B,C,D) %State space model
s = tf('s');            %Transfer function
P_cruise = 1/(m*s+b);

step(u*P_cruise)  %First order transformation,no oscillations

%% PID Controller - closed loop system

Kp = 1;
Ki = 1;
Kd = 1;

s = tf('s');
C = Kp + Ki/s + Kd*s  %Continuous time transfer function

%OR

%C = pid(Kp,Ki,Kd)
