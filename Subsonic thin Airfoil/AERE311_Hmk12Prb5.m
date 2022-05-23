%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%Solving for minimum pressure

clear,clc 

%given
Mc = .8;
Minf = .8;
Ma = Mc/Minf; %like 70% sure on that one
%localized mach will always be ratio of 1

%solving for P/Pinf
P_Pinf = ( (1 + (.2*Minf^2)) / (1 + (.2*Ma^2)) ) ^3.5;

fprintf('Min pressure is %d \n',P_Pinf);











