clear all
close all

load('sweep_A.mat');

for i = 1:nel
    d = designs{i};
    
    gm1(i) = d.m1.gm;
    gm2(i) = d.m2.gm;
    gp(i) = d.spice_gain_peaking;
    A(i) = d.m2.gm * d.r_2;
    noise(i) = d.spice_inoise_3db;
    if length(d.spice_f_cl)
        f(i) = d.spice_f_cl;
    else
        f(i) = 0;
    end
    a(i) = d.spice_a_cl;
end

h = figure();
set(h, 'Position', [100, 100, 800 600]);
plot(A, gp);
hold on;
plot([-100 100], [1 1], 'k--');
hold off
xlim([0 25]);
title('Gain peaking vs RGC Gain')
xlabel('Loop Gain = gm_2 * R_2');
ylabel('Gain Peaking (dB)');
legend('Gain Peaking (dB)', 'Spec Limit');

h = figure();
set(h, 'Position', [100, 100, 800 600]);
plot(A, f);
xlim([0 25]);
title('Bandwidth vs RGC Gain')
xlabel('Loop Gain = gm_2 * R_2');
ylabel('Bandwidth (GHz)');

h = figure();
set(h, 'Position', [100, 100, 800 600]);
plot(A, noise*1e12);
hold on;
plot([-100 100], [20 20], 'k--');
hold off
xlim([0 25]);
ylim([0 25]);
title('Noise vs RGC Gain')
xlabel('Loop Gain = gm_2 * R_2');
ylabel('Input Noise (pA/sqrt(Hz))');


