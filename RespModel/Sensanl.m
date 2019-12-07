% Program "sensanl.m" to perform sensitivity analysis for any model, given parameters
%  Plots changes in criterion function J +/-50% about nominal/reference value
%        of each parameter
% This program assumes that:
%  (1) a Function m-file has been created, which computes the model predictions 
%      given in column vector (ypred) for given parameter values
%    - should be of form:  ypred = function_name(parameter_vector)
%      where "parameter_vector" is a column vector containing the parameter values
%      (In this example, "fn_rlc.m" is the function called
%  (2) the input signal is supplied in the workspace in the form of column vector "u"
%      along with the corresponding time vector "t"


global t u
%Teim Vector and Input Signal
t = 0:0.01:25;
u = randn(numel(t),1);

%Entering the parameter values 
pararef = [1.5, 0.01, 0.1]; %R = params(1)   L = params(2)   C = params(3)
Np = numel(pararef);

% Compute model predictions for nominal parameter values
yref=fn_rlc(pararef); % replace this with different function in another application
para=zeros(size(pararef));

% Perform sensitivity calculations
step=5; % step-size between each computation = 5%
num_steps=2*(50/step)+1;
J=zeros(num_steps,Np);
para_change=[-50:step:50]';
for i=1:Np,
   for k=1:num_steps,
      para=pararef;
      para(i)=pararef(i)*(1 + para_change(k)/100);
      if para_change(k)==0,
         J(k,i)=0;
      else
         ypred=fn_rlc(para); % replace this with different function in another application
         e=ypred-yref;
         J(k,i)=sum(e.^2);
      end;
    end;
end;

%Generating the Graph
figure(1);title('Sensitivity of Linear Lung Mechanics Model(RLC)','fontweight', 'bold','fontsize',16);
xlabel('% Change over nominal parameter value','fontsize',10);ylabel('Change in J from nominal value( mmHg^2 )','fontsize',10);
hold on
a1 = plot(para_change,J(:,1),'r-x'); %R Curve
a2 = plot(para_change,J(:,2),'g-*'); %L Curve
a3 = plot(para_change,J(:,3),'b-o'); %C Curve
M1 = 'R';
M2 = 'L';
M3 = 'C';
legend([a1; a2; a3], M1,M2,M3 );
hold off;
