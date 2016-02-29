clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_j.ac0');
lssig(h)

f = evalsig(h,'HERTZ');

vo_cmplx = evalsig(h,'vo');

t_mag = evalsig(h,'lstb_db');
t_phase = evalsig(h,'lstb_phase') - 180;

t_mag_u_f = max(f(t_mag>0))


vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * unwrap(angle(vo_cmplx)) + 180;

t_hand = 28.74;
f_hand = -46.84;
a_hand = 75.59;
a_cl_hand = 57.2056;

t_spice = t_mag(1);

t_error = calc_err_pct(t_hand, t_spice);

h = figure();
set(h, 'Position', [100, 100, 800 600]);

subplot(2,1,1);
semilogx(f,t_mag,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [0 0]);
title('Amplifier T(jw) Magnitude and Phase - Compensated 57fF');

plot([t_mag_u_f t_mag_u_f], [-1000 0], 'k--x')
ylim([-20, 40]);
% annotate gain margin, phase margin, -180 frequency

%text(min(f) * 1.1, 25, 'Low Freq Loop Gain:')
s = sprintf('Low Freq loop Gain:\nHand: %0.1fdB\nSpice: %0.1fdB\nError: %0.1f%%', t_hand, t_spice, t_error);
text(min(f) * 10, 15, s)

f_u_hand = 19.2e9;
f_u_error = calc_err_pct(f_u_hand, t_mag_u_f);

s = sprintf('Unity Gain Freq:\nHand: %0.1fGHz\nSpice: %0.1fGHz\nError: %0.1f%%', f_u_hand/1e9, t_mag_u_f/1e9, f_u_error);
text(1e7, 15, s)

pm_hand = 65.5;
pm_spice = min(t_phase(t_mag>0)) +180
pm_error = calc_err_pct(pm_hand, pm_spice);


ylim([-30, 30]);
xlim([min(f),max(f)]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
%legend('Magnitude', 'Spice f_u');
grid;

hold off;
subplot(2,1,2);
semilogx(f,t_phase,'linewidth',2);
hold on;
plot([min(f) max(f)], [-180 -180]);
xlim([min(f),max(f)]);
ylim([-200, 15]);
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

s = sprintf('Phase Margin:\nHand: %0.1fdeg\nSpice: %0.1fdeg\nError: %0.1f%%', pm_hand, pm_spice, pm_error);
text(1e7, -120, s)

plot([t_mag_u_f t_mag_u_f], [-1000 pm_spice-180], 'k--x')

%saveas(h, 'report/plots/part_g', 'png')
print('-depsc','-r0','report/plots/part_j_t.eps')



a_cl_3db_spice = min(f(vo_mag<=vo_mag(1)-3));


% plotting closed loop gain and phase
% annotate 3db and maybe the -180deg phase points
% also plot T(s) and indicate phase margin and gain margin
% note error in bandwidth calculations

h = figure();
set(h, 'Position', [100, 100, 800 600]);
subplot(2,1,1);
semilogx(f,vo_mag,'linewidth',2);
hold on
plot([a_cl_3db_spice a_cl_3db_spice], [-1000, vo_mag(1)-3], 'k--x')
hold off
title('Amplifier A(jw) Magnitude and Phase - Compensated 57fF');
ylim([0, 70]);
xlim([min(f),max(f)]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
grid;


s = sprintf('Closed Loop 3dB:\nSpice: %0.1fGHz', a_cl_3db_spice/1e9);
text(1e7, 30, s)

subplot(2,1,2);
semilogx(f,vo_phase,'linewidth',2);
xlim([min(f),max(f)]);
ylim([-200, 15])
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

%s = sprintf('Imag Pole:\nHand: %0.1fGHz\nSpice: %0.1fGHz\nError: %0.1f%%', pole_1_hand/1e9, pole_1_spice/1e9, pole_1_err);
%text(1e6, -90, s)

print('-depsc','-r0','report/plots/part_j_a.eps')