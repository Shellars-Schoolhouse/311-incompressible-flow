%Written by Sean Hellar, 28 MAR 22
%AERE 311
%Nozzle regime pressure calculations 

clear,clc

A_Astar2 = input('Please enter A/A*: ');
Mg1 = .1;
Mg2 = 1.1;
xx1 = @(mx) ( ((5+mx^2)^3) / (6^3 * mx) ) - A_Astar2 ;
M4 = fsolve(xx1,Mg1);
P0_p4 = ( ( 1 + (1/5) * M4^2 ) )^3.5 ;
rho0_rho4 = ( ( 1 + (1/5) * M4^2 ) )^2.5 ;
T0_T4 = ( (P0_p4)^2 )^(1/7) ;
xx2 = @(my) ( ((5+my^2)^3) / (6^3 * my) ) - A_Astar2 ;
M5 = fsolve(xx2,Mg2);
P0_p5 = ( ( 1 + (1/5) * M5^2 ) )^3.5 ;
rho0_rho5 = ( ( 1 + (1/5) * M5^2 ) )^2.5 ;
T0_T5 = ( (P0_p5)^2 )^(1/7) ;
fprintf('Msub = %d P0/P = %d rho0/rho = %d  T0/T = %d \n',M4,P0_p4,rho0_rho4,T0_T4)
fprintf('Msup = %d P0/P = %d rho0/rho = %d  T0/T = %d\n',M5,P0_p5,rho0_rho5,T0_T5)



C1n = 1 / ( ( 1 + (1/5) * M4^2 ) )^3.5;
C2n = ( 1 / ( ( 1 + (1/5) * M5^2 ) )^3.5 ) *  ( ( (7 * M5^2 ) - 1 ) / 6 ); 
C3n = 1 / ( ( 1 + (1/5) * M5^2 ) )^3.5;

fprintf('C1 = %d \nC2 = %d \nC3 = %d \n', C1n, C2n, C3n); 
fprintf('subsonic if Pa/Po1 > %d\n', C1n);
fprintf('Shock in nozzle if %d < Pa/Po1 < %d \n', C2n, C1n);
fprintf('Over expanded if %d < Pa/Po1 < %d Oblique Shock at exit\n', C3n, C2n);
fprintf('Under expanded if Pa/Po1 < %d Expansion fan at exit\n', C3n);






