%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%Solving for mach and temp at exit

clear,clc 

%given normal temp 
Min = .25;
T_in = 300; %Kelvin
R = 287;
Cp = 3.5*R;
Q = 15.07e4;

%find the total heat added into system
Del_T0 = Q/Cp;

%find total temp at inlet at exit 
T_0in = (1 + .2*Min^2) * T_in ;
T_0exit = Del_T0 + T_0in ; 

%now plug in Min,Tin and Del T0 for Mach at exit 
T_0star = T_0in * ( ( ( 5 + 7*(Min^2) )^2 ) / ( (Min^2) * (120 + 24*(Min^2)) ) ) ;

%find a,b,c
c = T_0exit/T_0star;
a = R^2 * (c-1) + 1;
b = 1 - R * (c-1);

%find mach 
M_sup = sqrt( (b/a) + ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );
M_sub = sqrt( (b/a) - ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );

if Min < 1 
    T_ex = T_0exit / (1 + .2*M_sub^2);
    fprintf("Mach at exit is %d \nTemp at exit is %d \n", M_sub,T_ex);
else 
    T_ex1 = T_0exit / (1 + .2*M_sup^2);
    fprintf("Mach at exit is %d \nTemp at exit is %d \n", M_sup,T_ex1)
end 









