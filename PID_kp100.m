%% PID Controler, Kp varies

clc
clear

m = 1505;  %BMW 220i msport  
b = 50;
r = 10;

s = tf('s');
P_cruise = 1/(m*s + b);

Kp = 5000; %Kp = 100 gives slow response
C = pid(Kp);

T = feedback(C*P_cruise,1)

t = 0:0.1:20;
step(r*T,t)
axis([0 20 0 10])

%% PI Contoller - to eliminate steady state error

Kp = 600;
Ki = 1;
C = pid(Kp,Ki);

T = feedback(C*P_cruise,1);

step(r*T,t)
axis([0 20 0 10])