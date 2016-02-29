clc;
clear all;
close all;

f1 = 2.46e9;
f2 = 6.63e9;
T0 = 26.57;
T0_db = 28.4;

w1 = 2*pi*f1;
w2 = 2*pi*f2;

% Plotting manually
f = logspace(3,12);
j = sqrt(-1);
s = j*2*pi.*f;
for k = 1:size(f,2)
    T(k) = T0/((1+s(k)/w1)*(1+s(k)/w2)) ;
end

T_mag = 20 * log10(abs(T));
T_phase = 180/pi * (angle(T));

f_u_hand = 20.8e9;

h = figure();
set(h, 'Position', [100, 100, 800 600]);

subplot(2,1,1);
semilogx(f,T_mag,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [0 0],'r');
title('Amplifier T(jw) Magnitude and Phase - Sketch');

plot([f_u_hand f_u_hand], [-100 0], 'k--x')

% annotate gain margin, phase margin, -180 frequency

%text(min(f) * 1.1, 25, 'Low Freq Loop Gain:')
s = sprintf('Low Freq loop Gain: %0.1fdB', T0_db);
text(min(f) * 10, 35, s)

s = sprintf('Unity Gain Freq:\n %0.1fGHz', f_u_hand/1e9);
text(1e8, 10, s)

pm_hand = 24.4;

ylim([-30, 45]);
xlim([min(f),max(f)]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
grid;

hold off;
subplot(2,1,2);
semilogx(f,T_phase,'linewidth',2);
hold on;
plot([min(f) max(f)], [-180 -180],'r');
xlim([min(f),max(f)]);
ylim([-200, 15]);
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

s = sprintf('Phase Margin:\n %0.1f deg', pm_hand);
text(1e8, -120, s)

plot([f_u_hand f_u_hand], [-300 -180+pm_hand], 'k--x');

print('-depsc','-r0','report/plots/part_e.eps');
