%Plot of action potential frequency as a function of 
%stimulating current amplitude

sim_I   = [5	10	20	30	50	70	100];
ap_freq = [10	60	70	80	100	110	120];
figure();
plot(sim_I,ap_freq);
grid on;
xlabel('Stimulating current amplitude(\muA cm^{-2})');
ylabel('Action Potential Frequency(Hz)');
title('Stimulating current amplitude Action Potential Frequency(Hz)');


