%Written by Sean Hellar, 15 MAR 2022
%AERE 311
%Solving for lift and wave drag coeffcient (hopefully)

clear,clc

%given variables 
a = 0.1 ; %degrees
M1 = 5/3; 
r = 1.4; 


%finding nu1 and nu2
nu1 = ( ( sqrt(6) * atan( sqrt ((M1^2 - 1) / 6 ) ) ) - atan( sqrt (M1^2 - 1) ) ) ; %radians
nu1deg = rad2deg(nu1); %degrees
%fprintf('nu1 is %d degrees\n',nu1deg);
nu2 = nu1deg + a; %degrees 


%finding M2
nu2rad = deg2rad(nu2); %radians
Mg = 1/ (sin(nu2rad));

xx = @(M) ( ( sqrt(6) * atan( sqrt ((M^2 - 1) / 6 ) ) ) - atan( sqrt (M^2 - 1) ) ) - nu2rad ;
M2 = fsolve(xx,Mg);
%fprintf('The Mach value is %d\n',mach2); 


%finding pressure and temp ratios
To1_T1 = (1 + (1/5 * (M1^2)));
Po1_P1 = (To1_T1)^3.5;
To2_T2 = (1 + (1/5 * (M2^2)));
Po2_P2 = (To2_T2)^3.5;
P2_P1 = Po1_P1 * (1/Po2_P2);

%finding B1
theta = deg2rad(a); 

xx = @(bet) ( ( (2* cot(bet)) * ( (M1^2 * (sin(bet))^2) - 1) ) /  ( (M1^2 * (1.4 + (cos(2*bet)))) + 2 ) ) - (tan(theta));
beta0 = (1/M1); %intial guess
b = fsolve(xx,asin(beta0));
B1 = rad2deg(b);
%fprintf('beta is %d deg\n',B1);

%finding Mn1
Mn1 = M1 * sind(B1);

%finding pressure ratio
P3_P1 = ( (7 * Mn1^2) - 1 ) / 6 ;

%finding lift and drag coeffcients 
Cl = (2/ (r*(M1^2)) ) * ( (P3_P1) - (P2_P1) ) * cosd(a);
Cd = (2/ (r*(M1^2)) ) * ( (P3_P1) - (P2_P1) ) * sind(a); 

%print statements
fprintf('Lift coeffcient is %d \n',Cl);
fprintf('Wave drag coeffcient is %d \n',Cd);












