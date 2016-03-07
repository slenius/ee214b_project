clear all
close all

load 180nch.mat;
load 180pch.mat;

% accounting for m1 ro, this is more like 800 ohms in ac-ss
d.r_1 = 900;

c = initialize_constraints();
d = initialize_trans(d, c);

for i =1:5
    fprintf('Loop %d\n', i);
    d = run_design_loop(d, c, nch, pch);
end
d = check_node_voltages(d, c);
d = check_saturation(d, c);

write_rgc_file(d, c);
run_spice();
d = get_spice(d, c);

d