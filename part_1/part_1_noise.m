clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_noise.ac0');
lssig(h)

f = evalsig(h,'HERTZ');

vo_cmplx = evalsig(h,'vo');

vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * angle(vo_cmplx) - 180;

inoise = evalsig(h,'innoise');
onoise = evalsig(h,'outnoise');


% calculate the spectral density of outnoise at the 3db freq

figure;
semilogx(f, inoise);
title('inoise');


figure;
semilogx(f, onoise);
title('onoise');


figure;
semilogx(f, vo_mag);
title('vo_mag');
