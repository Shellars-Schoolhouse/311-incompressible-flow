%Written by Sean Hellar, 8 MAR 2022
%AERE 311

clc,clear


%known value 
M = 2.6;


%finding nu
nu = ( ( sqrt(6) * atan( sqrt ((M^2 - 1) / 6 ) ) ) - atan( sqrt (M^2 - 1) ) ) ;
nudeg = rad2deg(nu);
fprintf('nu is %d degrees\n',nudeg);











