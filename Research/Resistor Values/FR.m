clc;
clear;

B1 = 0.524;
B2 = 0.0476;

R = 1:1:10^7;

C = 0.1*10^(-6);

T1 = 2.*R.*C.*log((1+B1)./(1-B1));
T2 = 2.*R.*C.*log((1+B2)./(1-B2));

loglog(R, 1./T1);
hold on;
loglog(R,1./T2);

xlabel('Resistance, R');
ylabel('Frequency, {\it f}');
xlim([1, 10^7]);

grid on
grid minor

legend('Low Frequency', 'High Frequency');

R_1Hz = interp1(T1,R, 1)
R_10Hz = interp1(T1,R, 1/10)
R_100Hz = interp1(T1,R, 1/100)
R_1kHz = interp1(T1,R, 1/1000)
R_10kHz = interp1(T1,R, 1/10000)
R_100kHz = interp1(T1,R, 1/100000)

ftop = [1/interp1(R, T2, R_1Hz) 1/interp1(R, T2, R_10Hz) 1/interp1(R, T2, R_100Hz)
    1/interp1(R, T2, R_1kHz) 1/interp1(R, T2, R_10kHz) 1/interp1(R, T2, R_100kHz)]
