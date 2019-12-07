% electrical constants and derived quantities for typical 
% mammalian dendrite

% Dimensions of compartments

d1 = 75e-4; 			% cm
d21 = 30e-4; 			% cm
d22 = 15e-4; 			% cm

%Question 6
% d21 = 47.2470e-4;       % E9 cm
% d22 = d21;               % E9 cm

l1 = 1.5;			% dimensionless
l21 = 3.0;			% dimensionless
l22 = 3.0;			% dimensionless

% Electrical properties of compartments

Rm = 6e3;			% Ohms cm^2
Rc = 90;			% Ohms cm
Rs = 1e6;			% Ohms

c1 = 2*(Rc*Rm)^(1/2)/pi;

rl1 = c1*d1^(-3/2);		% Ohms
rl21 = c1*d21^(-3/2);		% Ohms
rl22 = c1*d22^(-3/2);		% Ohms


% Applied current

iapp = 1e-9; 	% Amps

% Coefficient matrices

A = [1 -1 0 0 0 0;
     0 0 exp(-l21) exp(l21) 0 0;
     0 0 0 0 exp(-l22) exp(l22);
     exp(-l1) exp(l1) -exp(-l1) -exp(l1) 0 0;
     0 0 exp(-l1) exp(l1) -exp(-l1) -exp(l1);
     -exp(-l1) exp(l1) rl1*exp(-l1)/rl21 -rl1*exp(l1)/rl21 rl1*exp(-l1)/rl22 -rl1*exp(-l1)/rl22];

b = [(rl1*iapp) 0 0 0 0 0]';

%Question 5 
% A(2,:) = [0 0 -exp(-l21) exp(l21) 0 0];                                                                                                         %uncomment this line for 2(a)
% A(2,:) = [0 0 -exp(-l21) exp(l21) 0 0];  A(3,:) = [0 0 0 0 -exp(-l22) exp(l22)];                                                                %uncomment this line for 2(b)
% A(2,:) = [0 0 -exp(-l21) exp(l21) 0 0]; b(1) = 0; b(2) = rl21*iapp;                                                                             %uncomment this line for 2(c)
% A(2,:) = [0 0 -exp(-l21) exp(l21) 0 0]; b(1) = 0; b(2) = rl21*iapp;    A(3,:) = [0 0 0 0 -exp(-l22) exp(l22)]; b(3) = rl22*iapp;                %uncomment this line for 2(d)




x = A\b;
disp (x);                       %Answer for Question 4

y1 =linspace(0,l1,20); 
y21 = linspace(l1,l21,20);
y22 = linspace(l1,l22,20);
v1 = x(1)*exp(-y1)+x(2)*exp(y1);
v21 = x(3)*exp(-y21) + x(4)*exp(y21);
v22 = x(5)*exp(-y22) + x(6)*exp(y22);
figure(2)
hold on
a1 = plot(y1,v1,'g-');
a21 = plot(y21,v21,'r-x');
a22 = plot(y22,v22,'b--');
M1 = 'Branch 1';
M21 = 'Branch 21';
M22 = 'Branch 22';
legend([a1; a21; a22], M1,M21,M22 );

xlabel('X (dimension)');
ylabel('V (volts)');
title('Steady - state voltage - E5');
hold off;
