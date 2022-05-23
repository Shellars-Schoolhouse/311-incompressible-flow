%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%solving for critical mach, given peak pressure coeffcient
%this is a cunt question 
%fuck it i give up 
clear,clc, close all

%given
Cpeak = -.41;
r = 1.4;
%guesses
M1 = .3;
M2 = .4;
M3 = .5;
M4 = .6;
M5 = .7;
M6 = .8;


%create Cp for different M
Cp1 = Cpeak / sqrt(1 - M1^2);
Cp2 = Cpeak / sqrt(1 - M2^2);
Cp3 = Cpeak / sqrt(1 - M3^2);
Cp4 = Cpeak / sqrt(1 - M4^2);
Cp5 = Cpeak / sqrt(1 - M5^2);
Cp6 = Cpeak / sqrt(1 - M6^2);

%create Cp critical for different M's 
Cpcr1 = (2/(r*M1^2)) * ( ( ((1+(.2*M1^2))/(1.2)) ^3.5 ) - 1 )
Cpcr2 = (2/(r*M2^2)) * ( ( ((1+(.2*M2^2))/(1.2)) ^3.5 ) - 1 )
Cpcr3 = (2/(r*M3^2)) * ( ( ((1+(.2*M3^2))/(1.2)) ^3.5 ) - 1 )
Cpcr4 = (2/(r*M4^2)) * ( ( ((1+(.2*M4^2))/(1.2)) ^3.5 ) - 1 )
Cpcr5 = (2/(r*M5^2)) * ( ( ((1+(.2*M5^2))/(1.2)) ^3.5 ) - 1 )
Cpcr6 = (2/(r*M6^2)) * ( ( ((1+(.2*M6^2))/(1.2)) ^3.5 ) - 1 )

x = M1,M2,M3,M4,M5,M6 ;
y = Cpcr1,Cpcr2,Cpcr3,Cpcr4,Cpcr5,Cpcr6 ;
xlimit = [ 0 5];
plot(x,y)



