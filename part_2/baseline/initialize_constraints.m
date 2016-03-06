function constraints = initialize_constraints()
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
%constraints.total_current = 10.1e-3;
constraints.total_current = 8e-3;
constraints.input_noise = 20e-12^2;
constraints.c_l = 20e-15;
constraints.gamma = 0.85;
constraints.c_d = 200e-15;
constraints.loop_gain = 8;

constraints.gm_id = 12 * [1 1 1 1 1];
constraints.gm_id(1) = 11;
constraints.gm_id(2) = 11;
constraints.stage_id_dist = [2/9 2/9 5/9];
constraints.stage_id = constraints.stage_id_dist * constraints.total_current;

constraints.a_v_3 = 5;
constraints.r_e4 = 15;

end