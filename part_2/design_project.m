clear all
close all


design = struct();
constraints = struct();

constraints.vdd = 1.8;
constraints.overal_gain_cl = 720;
constraints.total_current = 10.1e-3;
constraints.input_noise = 20e-12;
constraints.cl = 20e-15;

constraints.gm_id1 = 15;
constraints.gm_id2 = 15;
constraints.gm_id3 = 15;

design = get_gm_rf_from_noise(design, constraints);




