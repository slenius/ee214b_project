clc;
clear all;
close all;
addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_uncomp.ac0');
lssig(h)

f = evalsig(h,'HERTZ');
Ts_mag = evalsig(h,'lstb_db');
Ts_phase = evalsig(h,'lstb_phase') - 180;

vo_cmplx = evalsig(h,'vo');

vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * angle(vo_cmplx) - 180;

unity_index = find(abs(Ts_mag) == min(abs(Ts_mag)));
f_mag0 = f(unity_index);

phase180_index = find(abs(Ts_phase+180) == min(abs(Ts_phase+180)));

f_phase180 = f(phase180_index);


% plot T(s) - part g

% in db
t_handcalc = 28.74;
f_handcalc = -46.84;
a_handcalc = 75.59;

t_spice = Ts_mag(1)

t_error = calc_err_pct(t_handcalc, t_spice);

h = figure();
set(h, 'Position', [100, 100, 800 600]);

subplot(2,1,1);
semilogx(f,Ts_mag,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [0 0]);
title('Amplifier T(jw) Magnitude and Phase');

plot([f_mag0 f_mag0], [-100 Ts_mag(unity_index)], 'k--x')

% annotate gain margin, phase margin, -180 frequency

%text(min(f) * 1.1, 25, 'Low Freq Loop Gain:')
s = sprintf('Low Freq loop Gain:\nHandcalc: %0.1fdB\nSpice: %0.1fdB\nError: %0.1f%%', t_handcalc, t_spice, t_error);
text(min(f) * 10, 15, s)

f_u_hand = 2.0861e10;
f_u_error = calc_err_pct(f_u_hand, f_mag0);

s = sprintf('Unity Gain Freq:\nHandcalc: %0.1fGHz\nSpice: %0.1fGHz\nError: %0.1f%%', f_u_hand/1e9, f_mag0/1e9, f_u_error);
text(300e6, -10, s)

pm_hand = 24.06;
pm_spice = Ts_phase(unity_index) + 180
pm_error = calc_err_pct(pm_hand, pm_spice);


ylim([-30, 30]);
xlim([min(f),max(f)]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
%legend('Magnitude', 'Spice f_u');
grid;

hold off;
subplot(2,1,2);
semilogx(f,Ts_phase,'linewidth',2);
hold on;
plot([min(f) max(f)], [-180 -180]);
xlim([min(f),max(f)]);
ylim([-200, 0]);
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

s = sprintf('Phase Margin:\nHandcalc: %0.1fdeg\nSpice: %0.1fdeg\nError: %0.1f%%', pm_hand, pm_spice, pm_error);
text(3e7, -100, s)

plot([f_mag0 f_mag0], [-1000 pm_spice-180], 'k--x')

% plotting closed loop gain and phase
% annotate 3db and maybe the -180deg phase points

% figure(2);
% subplot(2,1,1);
% semilogx(f,vo_mag,'linewidth',2);
% hold on;
% hold off;
% %ylim([-30, 30]);
% xlim([1e6,1e11]);
% ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
% %legend('Magnitude', 'Location', 'southwest');
% grid;
% 
% subplot(2,1,2);
% semilogx(f,vo_phase,'linewidth',2);
% xlim([1e6,1e11]);
% ylim([-200, 30])
% ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
% grid;