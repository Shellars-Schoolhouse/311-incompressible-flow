%Written by Sean Hellar, 1 FEB 2022
%AER E 311
%Oblique Shock calculator 

clc,clear 

%given 
M1 = 1.95;
P1 = .8; 
T1 = 288;
theta1d = 18;
theta1 = deg2rad(theta1d);

%first find the beta

xx = @(bet) ( ( (2* cot(bet)) * ( (M1^2 * (sin(bet))^2) - 1) ) /  ( (M1^2 * (1.4 + (cos(2*bet)))) + 2 ) ) - (tan(theta1));
beta0 = (1/M1); %intial guess
b = fsolve(xx,asin(beta0));
beta1 = rad2deg(b);
fprintf('beta is %d deg\n',beta1);


%calculate P2, by first finding normal Mach 
Mn1 = M1 * sind(beta1);


Mn2 = sqrt( (5 + Mn1^2) / ( 7 * Mn1^2 - 1) );
T2_T1 = (( 7 * Mn2^2 - 1 ) * ( 5 + Mn1^2 )) / ( 36 * Mn1^2 );
P2_P1 =  (7 * Mn1^2 - 1) / 6 ; 

P2 = P2_P1 * P1 ;
T2 = T2_T1 * T1 ; 

M2 = Mn2 /( sind(beta1-theta1d));

%solving for pressure after reflected shock 



fprintf('M2 is %d \nMn2 is %d\nP2 is %d\nT2/T1 is %d\n',M2,Mn2,P2,T2_T1); 






