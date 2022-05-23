%Written by Sean Hellar, 10 APR 2022
%AERE 311
%Finding Mach in for choked flow 

clc,clear

%for choked flow, Mach at exit is sonic, thus M_ex = 1, and T_0ex/T_0star=1

%givens 
Del_T0 = 500; 
T_in = 199; 
P_in = 1; 
M_ex = 1;
T_0ex_T_0star = 1;
Tr = T_0ex_T_0star;
 

%fsolve way
Mg = 0.01;
xx = @(M_in) (((T_in * (1 + .2*(M_in^2))) + Del_T0) ) / ((T_in * (1 + .2*(M_in^2)) * (((5 + 7*(M_in^2))^2 ) / ((120 + 24*(M_in^2))*M_in^2)))) - 1 ;
M = fsolve(xx,Mg);
fprintf("Mach at inlet is %d \n",M);







