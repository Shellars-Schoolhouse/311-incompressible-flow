%Written by Sean Hellar, 5 MAY 2022
%AERE 311
%solving exit mach, mach before and after shock, position of shock 

%givens
P_01 = 1;
P_amb = .725;
Aratio = .25; %At/Ae

%subsonic at exit, thus Pexit = Pamb 
%use following equation based, rearrange for Mexit
%(125*P_01*A_t)/(216*P_amb*A_ex) = Mexit * sqrt( 1 + ( Mexit^2 / 5) )

LHS = (125*P_01*Aratio)/(216*P_amb);
Mexit = sqrt ( (-5 + sqrt(25 + (20*LHS^2)) ) / 2 ); 

%finding total pressure ratio 
P_0exit__P_01 = (P_amb/P_01) * (1 + (Mexit^2/5) )^3.5;

%solve for M1,M2
%M1 will change based on guess being sub or sup
P02_P01 = P_0exit__P_01; 
M1g = 1.1; %guess of M1 
xx = @(M1g) ( [(6*M1g^2)/(M1g^2 +5)]^3.5 ) * ( (6/((7*M1g^2) - 1))^2.5 ) - P02_P01 ; 
M1 = fsolve(xx,M1g); 
M2 = sqrt ( (5 + M1^2) / ((7*M1^2) -1 ) ) ;

%solving for position (x/xexit)
A_Astar = ((5+M2^2)^3) / (6^3 * M2);
pos = A_Astar - 1;

fprintf('Mexit is %d',Mexit);
fprintf('\nMach before shock is %d and after shock is %d\n',M1,M2);
fprintf('Position, x/x_exit is %d\n',pos);










