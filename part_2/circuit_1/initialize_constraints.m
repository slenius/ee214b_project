function constraints = initialize_constraints()
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
%constraints.total_current = 10.1e-3;
constraints.total_current = 8e-3;
constraints.input_noise = 20e-12;
constraints.c_l = 20e-15;
constraints.gamma = 0.85;
constraints.c_d = 200e-15;
constraints.loop_gain = 5;

constraints.input_noise_dist = [25/100 25/100];
%constraints.noise = constraints.input_noise_dist .* (constraints.input_noise^2);

constraints.gm_id = 9 * [1 1 1 1 1];
constraints.stage_id_dist = [2/9 2/9 5/9];
constraints.r1_r2_ratio = 2;
constraints.stage_id = constraints.stage_id_dist * constraints.total_current;

end