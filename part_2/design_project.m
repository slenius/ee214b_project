clear all
close all

%addpath('../matlab');
%addpath('/usr/class/ee214b/matlab');

load 180nch.mat;
load 180pch.mat;

design = struct();
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
%constraints.total_current = 10.1e-3;
constraints.total_current = 4e-3;
constraints.input_noise = 20e-12;
constraints.c_l = 20e-15;
constraints.gamma = 0.85;
constraints.c_d = 200e-15;
constraints.loop_gain = 4;

constraints.input_noise_dist = [50/100 50/100];
%constraints.noise = constraints.input_noise_dist .* (constraints.input_noise^2);

constraints.gm_id = [10 10 10 10 10];
constraints.stage_id_dist = [1/3 1/3 1/3];
constraints.r1_r2_ratio = 1;
constraints.stage_id = constraints.stage_id_dist * constraints.total_current;

design.c_f = 0;

design = initialize_trans(design, constraints);


design = get_af_from_rf_and_acl(design, constraints);
design = get_gm_rf_from_noise(design, constraints); 
design = get_trans_sizes_from_gm_id_current(design,constraints, nch, pch);
design = get_r1_r2_from_ratio(design, constraints);
design = get_node_voltages(design, constraints);

design.m1 = check_trans_sat(design.m1);
design.m2 = check_trans_sat(design.m2);
design.m3 = check_trans_sat(design.m3);
design.m4 = check_trans_sat(design.m4);
design.mb1 = check_trans_sat(design.mb1);
design.mb2 = check_trans_sat(design.mb2);
design.mb3 = check_trans_sat(design.mb3);


design = get_time_constants(design, constraints);

d = design

figure;
plot(-design.poles_f/1e9, '-*');
