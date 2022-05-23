%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%Solving for exit velocity, pressure and total pressure 
%duct is choked

clear,clc

%given 
M_exit = 1;
P_0in = 1;
T_0in = 199;
Del_T0 = 500;
T0_T0star = 1; %for choked flow
gamma = 1.4;
R = 287;

%solving for velocity
T_0ex = Del_T0 + T_0in;
Texit = T_0ex / (1 + .2*M_exit^2);
vel = sqrt( gamma*R*Texit );

%find Mach at inlet 
c = T_0in/T_0ex;
a = R^2 * (c-1) + 1;
b = 1 - R * (c-1);

%find mach 
M_sup = sqrt( (b/a) + ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );
M_sub = sqrt( (b/a) - ( (b/a) * sqrt(1 - ((c*a)/b^2) ) ) );

%not sure why, but Mach at in is assumed to be subsonic
M_in = M_sub;
Pexit = ( (5 + (7*M_in^2))/12 ) * ( 1 / (1 + (.2*M_in^2))^3.5 ) ;
P_0exit = Pexit*(1.2^3.5);

fprintf('Exit velocity is %d \nExit pressure is %d \nExit total pressure is %d \n',vel,Pexit,P_0exit);





