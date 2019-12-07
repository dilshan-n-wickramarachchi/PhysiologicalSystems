%Plotting I1st/I2nd vs delay
%MatLab 2017a version
I1 = 13.4
I2 = [13.7 13.4 12.6 11.6	11.3	12.7	17.0 ...
    25.5	40.8	70.1	145.3];
delay  = [25 24 22 20 18	16	14	12	10	8	6];
I1_div_I2 = I2./I1;
cftool(delay, I1_div_I2);

