%Written by Sean Hellar, 15 MAR 2022
%AERE 311
%Diadmond wedge airfoil lift and drag coeffcients
%diamond on my wrist yuh

clear,clc

%given variables 
ep = 10; %degress
a = 15; %degrees
M1 = 3; 
r = 1.4; 

%note: theta and alpha are interchangeable here

%theta 1-4
theta2 = a-ep; %degrees
theta3 = 2*ep; %degrees
theta4 = a+ep; %degrees
theta5 = theta3; %degrees

%finding nu1
nu1r = ( ( sqrt(6) * atan( sqrt ((M1^2 - 1) / 6 ) ) ) - atan( sqrt (M1^2 - 1) ) ) ;
nu1 = rad2deg(nu1r);
%fprintf('nu is %d degrees\n',nu1);

%finding nu2,nu3
nu2 = nu1+theta2;
nu3 = nu2+theta3;

%finding pressure ratio 1
To1_T1 = (1 + (1/5 * (M1^2)));
Po1_P1 = (To1_T1)^3.5;

%finding M2
nu2r = deg2rad(nu2);
Mg = 1/ (sin(nu2r));
xx = @(M) ( ( sqrt(6) * atan( sqrt ((M^2 - 1) / 6 ) ) ) - atan( sqrt (M^2 - 1) ) ) - nu2r ;
M2 = fsolve(xx,Mg);
%fprintf('The Mach value is %d\n',M2);


%finding pressure ratio 2
To2_T2 = (1 + (1/5 * (M2^2)));
Po2_P2 = (To2_T2)^3.5;

%finding M3
nu3r = deg2rad(nu3);
Mg1 = 1/ (sin(nu3r));
xx1 = @(Mx) ( ( sqrt(6) * atan( sqrt ((Mx^2 - 1) / 6 ) ) ) - atan( sqrt (Mx^2 - 1) ) ) - nu3r ;
M3 = fsolve(xx1,Mg1);
%fprintf('The Mach value is %d\n',M3);

%finding pressure ratio 3
To3_T3 = (1 + (1/5 * (M3^2)));
Po3_P3 = (To3_T3)^3.5;

%finding B4
theta4r = deg2rad(theta4); % radians
xx2 = @(bet) ( ( (2* cot(bet)) * ( (M1^2 * (sin(bet))^2) - 1) ) /  ( (M1^2 * (1.4 + (cos(2*bet)))) + 2 ) ) - (tan(theta4r));
beta0 = (1/M1); %intial guess
b = fsolve(xx2,asin(beta0));
B4 = rad2deg(b);
%fprintf('beta is %d deg\n',B4);


%finding Mn1
Mn1 = M1*sin(b);


%finding ratios 
T4_T1 = ( ( (7 * Mn1^2) - 1 ) * ( 5 + Mn1^2 ) ) / (36 * Mn1^2);
P4_P1 = ( (7 * Mn1^2) - 1 ) / 6 ;
Mn4 = sqrt ( (5 + Mn1^2) / ((7*Mn1^2) -1 ) ) ;
Po4_Po1 = P4_P1 * ((1/T4_T1)^3.5);

%finding M4
M4 = Mn4 / (sind (B4-theta4) );

%finding nu4
nu4r = ( ( sqrt(6) * atan( sqrt ((M4^2 - 1) / 6 ) ) ) - atan( sqrt (M4^2 - 1) ) ) ;
nu4 = rad2deg(nu4r);

%finding pressure ratio 4
To4_T4 = (1 + (1/5 * (M4^2)));
Po4_P4 = (To4_T4)^3.5;

%finding nu5
nu5 = nu4 + theta5; %degrees

%finding M5
nu5r = deg2rad(nu5);
Mg1 = 1/ (sin(nu5r));
xx3 = @(My) ( ( sqrt(6) * atan( sqrt ((My^2 - 1) / 6 ) ) ) - atan( sqrt (My^2 - 1) ) ) - nu5r ;
M5 = fsolve(xx3,Mg1);
%fprintf('The Mach value is %d\n',M5); 

%finding pressure ratio 5
To5_T5 = (1 + (1/5 * (M5^2)));
Po5_P5 = (To5_T5)^3.5;

%finding big boy pressure ratios
P2_P1 = (1/Po2_P2) * Po1_P1;
P3_P1 = P2_P1 * (1/Po3_P3) *Po2_P2;
P5_P1 = (1/Po5_P5) * Po4_Po1 * Po1_P1;

%lift and drag coeffcients
l_c = 1/ (2 * cosd(ep) );

Cl = ((2/ (r*(M1^2)) ) * l_c ) * ( ( ( (P4_P1) - (P3_P1) ) * cosd(theta4) )+ ( ( (P5_P1) - (P2_P1) ) * cosd(theta2) ) );
Cd = ((2/ (r*(M1^2)) ) * l_c ) * ( ( ( (P4_P1) - (P3_P1) ) * sind(theta4) )+ ( ( (P5_P1) - (P2_P1) ) * sind(theta2) ) );

%print statements
fprintf('Lift coeffcient is %d \n',Cl);
fprintf('Wave drag coeffcient is %d \n',Cd);









