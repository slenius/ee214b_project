clear all
close all

load 180nch.mat
load 180pch.mat

design = struct();
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
constraints.total_current = 10.1e-3;
constraints.input_noise = 20e-12;
constraints.cl = 20e-15;

constraints.gm_id1 = 15;
constraints.gm_id2 = 15;
constraints.gm_id3 = 15;

%design = get_gm_rf_from_noise(design, constraints);

design.r_f = 700;

design = get_af_from_rf_and_acl(design, constraints);



d = design

