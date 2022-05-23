%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%Solving for critical mach number 

%given 
%if he gives the peak pressure he's hore
Cp = -1;

%solving for Mach critical
Mg = .1; 
xx = @(Mc) ( ( ( 10*sqrt(1-(Mc^2)) ) / (7*Mc^2) ) * ( ((5 + Mc^2)/6)^3.5 - 1 ) ) - Cp
Mach = fsolve(xx,Mg)












