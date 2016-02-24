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


% plot T(s)

figure(1);
subplot(2,1,1);
semilogx(f,Ts_mag,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [0 0]);

plot([f_mag0 f_mag0], [-100 Ts_mag(unity_index)], 'k--x')

% annotate gain margin, phase margin, -180 frequency

hold off;
ylim([-30, 30]);
xlim([1e6,1e11]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
legend('Magnitude', 'Spice f_u');
grid;

subplot(2,1,2);
semilogx(f,Ts_phase,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [-180 -180]);
hold off;
xlim([1e6,1e11]);
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

% plotting closed loop gain and phase
% annotate 3db and maybe the -180deg phase points

figure(2);
subplot(2,1,1);
semilogx(f,vo_mag,'linewidth',2);
hold on;
hold off;
%ylim([-30, 30]);
xlim([1e6,1e11]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
legend('Magnitude', 'Location', 'southwest');
grid;

subplot(2,1,2);
semilogx(f,vo_phase,'linewidth',2);
xlim([1e6,1e11]);
ylim([-200, 30])
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;