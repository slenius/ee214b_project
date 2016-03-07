function constraints = initialize_constraints()
constraints = ee214b_defaults('mos180', 300);

constraints.vdd = 1.8;
constraints.overall_gain_cl = 720;
constraints.total_current = 10.1e-3;
constraints.input_noise = 20e-12;
constraints.c_l = 20e-15;
constraints.gamma = 0.85;
constraints.c_d = 200e-15;
constraints.loop_gain = 2;

end