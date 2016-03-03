clear all
close all

addpath('../matlab');
addpath('/usr/class/ee214b/matlab');

load 180nch.mat;
load 180pch.mat;

design = struct();
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
constraints.total_current = 10.1e-3;
constraints.input_noise = 20e-12;
constraints.cl = 20e-15;
constraints.gamma = 0.85;
constraints.cd = 200e-15;
constraints.input_noise_dist = [1/3 4/9 1/9];
constraints.noise = constraints.input_noise_dist .* (constraints.input_noise^2);


constraints.gm_id = [10 10 10 10];
constraints.stage_id_dist = [1/3 1/3 1/3];
constraints.r1_r2_ratio = 1;
constraints.stage_id = constraints.stage_id_dist * constraints.total_current;

design = initialize_trans(design, constraints);

design = get_gm_rf_from_noise(design, constraints);

design = get_af_from_rf_and_acl(design, constraints);
 


%design.r_f = 700;

design = get_af_from_rf_and_acl(design, constraints);
design = get_trans_sizes_from_gm_id_current(design,constraints, nch, pch);
design = get_r1_r2_from_ratio(design, constraints);
design = get_time_constants(design, constraints);


