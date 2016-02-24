clc;
clear all;
close all;
addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1.ac0');
lssig(h)

f = evalsig(h,'HERTZ');
Ts_mag = evalsig(h,'lstb_db');
Ts_phase = evalsig(h,'lstb_phase') - 180;

%f_mag0 = interp1(Ts_mag,f,0,'near');
%f_phase180 = interp1(Ts_phase,f,-180,'near');

figure(1);
subplot(2,1,1);
semilogx(f,Ts_mag,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [0 0]);
hold off;
xlim([1e6,1e11]);
ylabel('Magnitude (dB)'); xlabel('Frequency (Hz)');
grid;

subplot(2,1,2);
semilogx(f,Ts_phase,'linewidth',2);
hold on;
semilogx([min(f) max(f)], [-180 -180]);
hold off;
xlim([1e6,1e11]);
ylabel('Phase (degrees)'); xlabel('Frequency (Hz)');
grid;

