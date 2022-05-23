%Written by Sean Hellar, 5 MAY 2022
%AERE 311 Homework 13, problem 9
%a diamond wedge but somehow easier yet still complicated ???

clear,clc 

ML=2.9; 

%coeffcient of pressure 
cpa = 2 / (sqrt(ML^2 - 1) ); %leaves theta as a variable 

P_Pinf1 = (1.4 * ML^2 *cpa ) / 2 ; %leaves theata as a varaible

%angles for the wedge 
eps=10; %degrees
alpha=15; %degrees
a1=alpha-eps;
a2=alpha+eps;

%angles on each side 
s2theta = deg2rad(a1);
s3theta = deg2rad(a2);
s4theta = deg2rad(a2);
s5theta = deg2rad(a1);

%pressure ratios,, multiplying by the diff thetas
p_pinf2 = (-P_Pinf1 * s2theta ) + 1;
p_pinf3 = (-P_Pinf1 * s3theta ) + 1;
p_pinf4 = (P_Pinf1 * s4theta ) + 1;
p_pinf5 = (P_Pinf1 * s5theta ) + 1; 


l_c = 1/ (2 * cosd(eps) );

%coefficents of lift,drag
Cl = ((2/ (1.4*(ML^2)) ) * l_c ) * ( ( ( (p_pinf4) - (p_pinf3) ) * cos(s4theta) )+ ( ( (p_pinf5) - (p_pinf2) ) * cos(s2theta) ) );
Cd = ((2/ (1.4*(ML^2)) ) * l_c ) * ( ( ( (p_pinf4) - (p_pinf3) ) * sin(s4theta) )+ ( ( (p_pinf5) - (p_pinf2) ) * sin(s2theta) ) );

%percent error
Cle = .418;
Cde = .169;
pe_cl = ( (abs(Cl - Cle)) / Cle ) * 100 ;
pe_cd = ( (abs(Cd - Cde)) / Cde ) * 100;

fprintf("Cl is %d, error is %d%%\nCd is %d, error is %d%%\n", Cl, pe_cl, Cd, pe_cd);

