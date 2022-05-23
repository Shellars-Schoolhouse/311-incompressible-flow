%Written by Sean Hellar, 20 APR 2022 ;)
%AERE 311
%Finding pressure on top/bottom airfoil surfaces w/ linearized theory

clear,clc

%given
alpha = 30; %degrees
arad = deg2rad(alpha); %radians
M = 2.7;
ptope = .0725;
pbottome = 5.687;
lam = 1.4;


%coeffienct of pressure
cp = (2 * arad) / ( sqrt( M^2 - 1) );

%pressure 
p_pinf = ((cp * lam * M^2) / 2 ); 
ptop = -p_pinf + 1; 
pbottom = p_pinf + 1; 

%percent error 
pe_top = ( (abs(ptop - ptope)) / ptope ) * 100;
pe_bottom = ( (abs(pbottom - pbottome)) /pbottome )* 100;

fprintf('Ptop is %d, error is %d%% \nPbottom is %d, error is %d%% \n', ptop,pe_top,pbottom,pe_bottom);







