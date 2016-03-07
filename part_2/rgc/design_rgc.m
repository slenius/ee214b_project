clear all
close all

load 180nch.mat;
load 180pch.mat;

d.r_1 = 900;

c = initialize_constraints();
d = initialize_trans(d, c);

A = 6;
d.r_b = A / d.m2.gm;

d = get_trans_sizes(d, c, nch, pch);

ro = 1.5e3;

d.a_v_cd = d.m3.gm_prime * ro / (1 + d.m3.gm_prime * ro);

d = get_node_voltages(d, c);
d = check_node_voltages(d, c);
d = check_saturation(d, c);

write_rgc_file(d, c);
run_spice();
d = get_spice(d, c);

d