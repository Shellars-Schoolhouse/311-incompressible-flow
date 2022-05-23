%Written by Sean Hellar, 20 APR 2022 ;)
%AERE 311
%Lift and wave drag coeffcients using linearized theory

clear,clc 

%given variables 
alpha = 5; %degrees
arad = deg2rad(alpha); %radians
M = 2.6;
cle = .148;
cde = .0129;

%coeffcients
cl = (4 * arad) / ( sqrt( M^2 - 1) );
cd = (4 * arad^2) / ( sqrt( M^2 - 1) );

%percent error
p1 = ( ( abs(cl - cle) )/ cle ) * 100;
p2 = ( ( abs(cd - cde) )/ cde ) * 100;

fprintf('Cl is %d, error is %d%% \nCd is %d, error is %d%% \n', cl,p1,cd,p2);








