%Written by Sean Hellar, date unkown
%looks like it solves for mach, given beta and theta

clc,clear 

%intial parameters
beta = deg2rad(44);
theta = deg2rad(20);
Mg = 1/ (sin(beta));

d = ( tan(beta-theta) ) / tan(beta) ; 
xx = @(M)( 5 + ((M*sin(beta))^2) ) / ( 6 * ((M*sin(beta))^2) ) - d ;
%xx = @(M) ( ( sqrt(6) * atan( sqrt ((M^2 - 1) / 6 ) ) ) - atan( sqrt (M^2 - 1) ) ) - beta ;
mach = fsolve(xx,Mg);
fprintf('The Mach value is %d\n',mach);