%Written by Sean Hellar, 8 MAR 2022
%AERE 311
%Mach root finder

clc,clear 

%intial parameters
nu = deg2rad(49.76);
Mg = 1/ (sin(nu));


xx = @(M) ( ( sqrt(6) * atan( sqrt ((M^2 - 1) / 6 ) ) ) - atan( sqrt (M^2 - 1) ) ) - nu ;
mach = fsolve(xx,Mg);
fprintf('The Mach value is %d\n',mach);











