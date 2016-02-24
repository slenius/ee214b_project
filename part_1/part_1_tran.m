clear all
close all

addpath('/usr/class/ee214/matlab/hspice_toolbox');

h = loadsig('part1_tran.tr0');
lssig(h)

t = evalsig(h,'TIME');
vo = evalsig(h,'vo');


figure;
plot(t*1e9, vo);

xlabel('Time (ns)');
ylabel('Voltage (V)');
title('Transient Response - 1GHz');