%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%Solving for mach and pressure at exit

clear,clc

%given absolute temp
M_in = 1.9;
T_0in = 650;
Del_T0 = 90;
P_in = 1;
r = 1.4;

%solve for temps 
T_0ex = T_0in + Del_T0;
T_0star = T_0in * ( ( ( 5 + 7*(M_in^2) )^2 ) / ( (M_in^2) * (120 + 24*(M_in^2)) ) ) ;

%find a,b,c
c = T_0ex/T_0star;
a = r^2 * (c-1) + 1;
b = 1 - r * (c-1);

%find mach 
M_sup = sqrt( (b/a) + ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );
M_sub = sqrt( (b/a) - ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );

if M_in < 1 
    P_ex = 1 / ( (5 + (7*M_sub^2) ) / (5 + (7*M_in^2) ) ) ;
    fprintf("Mach at exit is %d \nPressure at exit is %d \n", M_sub,P_ex);
else 
    P_ex1 = 1 / ( (5 + (7*M_sup^2) ) / (5 + (7*M_in^2) ) ) ;
    fprintf("Mach at exit is %d \nPressure at exit is %d \n", M_sup,P_ex1)
end 


