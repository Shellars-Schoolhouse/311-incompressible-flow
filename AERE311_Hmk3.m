%Written by Sean Hellar, 5 FEB 2022
%Homework 3 questions 


% Problem 1 
% Given 
    % Temp = 300 K
    % P = 1.2 atm 
    % V = 305 m/s
    % r = 1.4
    % R = 287 
% Calculate P0, Temp0, P*, Temp*, M* 
    % Temp0/Temp = ( 1 + (1/5)*M^2 )
    %%% Temp0 = (Temp0/Temp) * Temp
    % P0/P = (Temp0/Temp)^3.5 
    %%% P0 = (P0/P) * P 
    % P*/P0 = ( 2 / (r+1) )^3.5 = .528 (constant) 
    % P*/P = (P*/P0) * (P0/P) 
    %%% P* = (P*/P) * P  
    % Temp*/Temp0 = 2/(r+1) = .833 (constant)
    % Temp*/Temp = (Temp*/Temp0) * (Temp0/Temp) 
    %%% Temp* = (Temp*/Temp) * Temp 
    % a* = sqrt( r * R * Temp* )
    %%% M* = V/a* 
    
    
    
% Problem 2
% Given 
    % P = 1 atm 
    % T = 230 K 
    % M = 2.55
% Find reservoir tempature and pressure 
    % Temp0/Temp = ( 1 + (1/5)*M^2 )
    %%% Temp0 = (Temp0/Temp) * Temp
    % P0/P = (Temp0/Temp)^3.5 
    %%% P0 = (P0/P) * P 
    
    
    
% Problem 3
% Given 
    % Alt = 10,000 ft
    % M@ = .82 
    % M = .74 
    % P@ = 1455.6 lb/ft^2
    % Temp@ = 483.04 R
% FInd pressure and tempature at this point 
    % Temp0/Temp = ( 1 + (1/5)*M^2 ) (calculate for both M's)
    %%% Temp = (Temp0/Temp) * (1/(Temp0/Temp)) * T@
    % P0/P = (Temp0/Temp)^3.5  
    % P0/P@ = 1.5552 (M=0.82 from Cal tables) 
    % P0/P@ = 1.4386 (M=0.74 from Cal tables) 
    %%% P = (P/P0) * (P0/P@) * P@ 
    






