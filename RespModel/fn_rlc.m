function ypred=fn_rlc(params);
%  This function generates a vector ypred, containing the values of the
%   model prediction in response to input forcing (given in vector u)
%   and for given parameter values of R, L and C

global t u

%Assigning values to Parameters 
R = params(1);
L = params(2); 
C = params(3);

%Creating the Laplce Equation
num=[C 0];  %sC 
den=[L*C  R*C  1];  %(s^2)LC + sRC + 1
Hs=tf(num,den);
ypred=lsim(Hs,u,t);
