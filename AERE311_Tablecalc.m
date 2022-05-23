%Written by Sean Hellar, 1 FEB 2022
%AER E 311
%Isentropic flow value calculator

clear,clc

x = input( 'Please signify what information you have (1=M 2=P0/P 3=rho0/rho 4=T0/T0 5=A/A*) ');

%M is known 
if x<=1
    M = input('Please enter M: ');
    P0_p = ( ( 1 + (1/5) * M^2 ) )^3.5 ; 
    rho0_rho = ( ( 1 + (1/5) * M^2 ) )^2.5 ; 
    T0_T = ( (P0_p)^2 )^(1/7) ; 
    M2 = sqrt ( (5 + M^2) / ((7*M^2) -1 ) ) ; 
    A_Astar = ((5+M^2)^3) / (6^3 * M);
    %this is only for input of normal Mach, irrelevant for all else
    rho2_rho1 = ( 6 * M^2 ) / ( 5 + M^2) ;
    P2_P1 = ( (7 * M^2) - 1 ) / 6 ;
    T2_T1 = ( ( (7 * M^2) - 1 ) * ( 5 + M^2 ) ) / (36 * M^2);
    Po2_Po1 = P2_P1 * ((1/T2_T1)^3.5);
    P1_Po2 = ( (5^3.5) * (( (7 * M^2) - 1 )^2.5) ) / ( 6^6 * (M^1.4) ) ;
    fprintf('M = %d P0/P = %d rho0/rho = %d T0/T = %d Mn2 = %d A/A* = %d',M,P0_p,rho0_rho,T0_T,M2,A_Astar)
    fprintf('\nAll below values are for normal shock Mach only\nrho2/rho1 = %d P2/P1 = %d T2/T1 = %d Po2/Po1 = %d P1/Po2 is %d\n',rho2_rho1,P2_P1,T2_T1,Po2_Po1,P1_Po2);
%P0/P is known 
elseif x<=2
    P0_p1 = input('Please enter P0/P: ');
    fprintf("Not sure why sqrt is imaginary but magnitude is correct\n")
    %Md = sqrt( ( (5 * (P0_p1)^(2/7) ) - 5 )* -1 ) %multiply by negative one to elim imaginary roots
    M1 = ( ( ( (P0_p1)^(2/7) ) - 1 ) * 5 ) ^ 0.5 
    rho0_rho1 = ( ( 1 + (1/5) * M1^2 ) )^2.5 ;
    %T0_T1 = (P0_p1) ^(287.05/3.5);
    T0_T1 = ( (rho0_rho1)^2 )^(1/5) ;
    A_Astar1 = ((5+M1^2)^3) / (6^3 * M1)
    fprintf('M = %d P0/P = %d rho0/rho = %d T0/T = %d A/A* = %d\n',M1,P0_p1,rho0_rho1,T0_T1,A_Astar1)
%rho0/rho is known 
elseif x<=3
    rho0_rho2 = input('Please enter rho0/rho: '); 
    M2 = ( ( ( (rho0_rho2)^ (2/5) ) - 1 ) * 5 ) ^ 0.5 ; 
    P0_p2 = ( ( 1 + (1/5) * M2^2 ) )^3.5 ;
    T0_T2 = ( (P0_p2)^2 )^(1/7) ; 
    fprintf('M = %d P0/P = %d rho0/rho = %d T0/T = %d\n',M2,P0_p2,rho0_rho2,T0_T2)
%T0/T is known
elseif x<=4
    T0_T3 = input('Please enter T0/T: '); 
    M3 = ( ( T0_T3 - 1 ) * 5 ) ^ 0.5 ; 
    P0_p3 = ( ( 1 + (1/5) * M3^2 ) )^3.5 ;
    rho0_rho3 = ( ( 1 + (1/5) * M3^2 ) )^2.5 ;
    fprintf('M = %d P0/P = %d rho0/rho = %d  T0/T = %d\n',M3,P0_p3,rho0_rho3,T0_T3)
%A/A* is known
else 
    A_Astar2 = input('Please enter A/A*: ');
    Mg1 = .1;
    Mg2 = 1.1;
    %subsonic mach
    xx1 = @(mx) ( ((5+mx^2)^3) / (6^3 * mx) ) - A_Astar2 ;
    M4 = fsolve(xx1,Mg1);
    P0_p4 = ( ( 1 + (1/5) * M4^2 ) )^3.5 ; 
    rho0_rho4 = ( ( 1 + (1/5) * M4^2 ) )^2.5 ; 
    T0_T4 = ( (P0_p4)^2 )^(1/7) ; 
    %same thing but with supersonic mach
    xx2 = @(my) ( ((5+my^2)^3) / (6^3 * my) ) - A_Astar2 ;
    M5 = fsolve(xx2,Mg2);
    P0_p5 = ( ( 1 + (1/5) * M5^2 ) )^3.5 ;  
    rho0_rho5 = ( ( 1 + (1/5) * M5^2 ) )^2.5 ; 
    T0_T5 = ( (P0_p5)^2 )^(1/7) ;
    fprintf('Msub = %d P0/P = %d rho0/rho = %d  T0/T = %d \n',M4,P0_p4,rho0_rho4,T0_T4)
    fprintf('Msup = %d P0/P = %d rho0/rho = %d  T0/T = %d\n',M5,P0_p5,rho0_rho5,T0_T5)
end 






