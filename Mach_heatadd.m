%Written by Sean Hellar, 6 APR 2022
%AERE 311 
%Solving for Mach with heat addition

clear,clc


%known 
M_in = .30005;
%T_0in = 650;
Del_T0 = 510;
r = 1.4;
Tin = 398;

%if given Tin use this, comment T_0in line 10
T_0in = (1 + (1/5)*(M_in^2)^2)*Tin;

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
    fprintf("Mach is %d \n", M_sub);
else 
    fprintf("Mach is %d \n", M_sup)
end 
    









