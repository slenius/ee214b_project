clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_comp.ac0');
lssig(h)

f = evalsig(h,'HERTZ');

vo_cmplx = evalsig(h,'vo');

vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * angle(vo_cmplx) - 180;


% plotting closed loop gain and phase
% annotate 3db and maybe the -180deg phase points
% also plot T(s) and indicate phase margin and gain margin
% note error in bandwidth calculations

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