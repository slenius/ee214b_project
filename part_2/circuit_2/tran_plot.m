clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('rgc.tr0');
lssig(h)

t = evalsig(h,'TIME');
vo = evalsig(h,'n_o');


h = figure();
set(h, 'Position', [100, 100, 800 600]);
plot(t*1e9, vo);

xlabel('Time (ns)');
ylabel('Voltage (V)');
title('Transient Response - 1GHz');

print('-depsc','-r0','report/plots/part_m.eps')