%Written by Sean Hellar, 30 MAR 2022
%AERE 311
%Solves for M, with shock in nozzle

clear,clc 

%given stuff 
At_Ae = 1 / (1.53) ; %most ratios are given as Ae/At
Pot_Pe = 1 / (.75) ; %most ratios are given as Pe/Po 

%mathhh
RHS = ( (5/6)^3 * At_Ae * Pot_Pe ) ^2 ;
Me = sqrt ( ( ( sqrt (25 + (20 * RHS)) -5 ) )/ 2 ) ; 

fprintf('Exit Mach number is %d', Me);






