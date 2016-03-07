clear all
close all

load 180nch.mat;
load 180pch.mat;

d.r_1 = 720;
d.r_b = 400;

c = initialize_constraints();
d = initialize_trans(d, c);

A = 5;
d.r_b = A / d.m2.gm;

d = get_trans_sizes(d, c, nch, pch);

write_rgc_file(d, c);
run_spice();
d = get_spice(d, c);

d