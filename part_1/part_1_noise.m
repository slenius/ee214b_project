clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_m.ac0');
lssig(h)

f = evalsig(h,'HERTZ');

vo_cmplx = evalsig(h,'vo');

vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * angle(vo_cmplx) - 180;

inoise = evalsig(h,'innoise');
onoise = evalsig(h,'outnoise');

f3db = 17e9;

% calculate the spectral density of outnoise at the 3db freq

h = figure();
set(h, 'Position', [100, 100, 800 600]);
semilogx(f, sqrt(inoise)*1e12, 'linewidth',2);
hold on;
plot([f3db f3db], [-180 sqrt(3.312e-22)*1e12], 'k--x');
title('Input Referred Noise');
t = 'Noise $$ (\frac{pA}{\sqrt Hz}) $$';
ylabel('Noise (pA / sqrt(Hz))');
xlabel('Frequency (Hz)');
xlim([min(f) 3e10])
ylim([0 50])
grid;

%h = figure();
%set(h, 'Position', [100, 100, 800 600]);
%semilogx(f, onoise, 'linewidth',2);
%title('Output Referred Noise');

noise_hand = 8.8673e-12
noise_spice = sqrt(inoise(1))
noise_error = calc_err_pct(noise_hand, noise_spice)
noise_3db = sqrt(3.312e-22)

t = sprintf('Input Low Freq Noise:\nHand: %0.1f pA/sqrt(Hz)\nSpice: %0.1f pA/sqrt(Hz)\nError:%0.1f%%', noise_hand*1e12, noise_spice*1e12, noise_error)
text(1e5, 25, t)

t = sprintf('Noise at 3dB Frequency:\n%0.1f pA/sqrt(Hz)', noise_3db*1e12)
text(1e8, 25, t)

print('-depsc','-r0','report/plots/part_l.eps')
