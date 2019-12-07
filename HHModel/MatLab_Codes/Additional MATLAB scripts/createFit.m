function [fitresult, gof] = createFit(delay, I1_div_I2)
%CREATEFIT(DELAY,I1_DIV_I2)
%  Create a fit.
%
%  Data for 'Best Fit Line' fit:
%      X Input : delay
%      Y Output: I1_div_I2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 16-Nov-2017 19:19:48


%% Fit: 'Best Fit Line'.
[xData, yData] = prepareCurveData( delay, I1_div_I2 );

% Set up fittype and options.
ft = fittype( 'power2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [688.750816977843 -2.22278112787124 -0.52853856211544];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Best Fit Line' );
h = plot( fitresult, xData, yData );
legend( h, 'I1_div_I2 vs. delay', 'Best Fit Line', 'Location', 'NorthEast' );
% Label axes
xlabel delay
ylabel I1_div_I2
grid on

