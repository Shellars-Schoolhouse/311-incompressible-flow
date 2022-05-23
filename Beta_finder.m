%Written by Sean Hellar, 23 FEB 2022
%AERE 311
%Beta root finder, solving for beta 

clc,clear


%intial parameters
M = 1.2622;
theta = deg2rad(18); 

xx = @(bet) ( ( (2* cot(bet)) * ( (M^2 * (sin(bet))^2) - 1) ) /  ( (M^2 * (1.4 + (cos(2*bet)))) + 2 ) ) - (tan(theta));
%xx = @(bet) ( (6 * (M * sin(bet) )^2 ) / ( 5 + (M * sin(bet) )^2 ) ) - ( tan(bet) / tan(bet-theta) );
beta0 = (1/M); %intial guess
b = fsolve(xx,asin(beta0));
beta = rad2deg(b);
fprintf('beta is %d deg\n',beta);

M2 = sqrt( (5 + M^2) / ( 7 * M^2 - 1) );
T2_T1 = (( 7 * M^2 - 1 ) * ( 5 + M^2 )) / ( 36 * M^2 );
P2_P1 =  (7 * M^2 - 1) / 6 ; 
fprintf('M2 is %d\nP2/P1 is %d\nT2/T1 is %d\n',M2,P2_P1,T2_T1); 
fprintf("Theta exceeds max, shock is detached");

% Mn1 = M*sin(b); 
% phi = beta-theta;
% %Mn2 comes from table calc
% Mn2 = input('What is Mn2');
% M2a = Mn2/sin(deg2rad(phi));
% fprintf('Mn1 is %d\nphi is %d deg\nM2 is %d\n',Mn1,phi,M2a);

%take Mn1 into Tablecalc program 






%i want to shoot myself 
%this literally works in the command window 











