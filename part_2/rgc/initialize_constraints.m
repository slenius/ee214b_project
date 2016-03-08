function c = initialize_constraints()
c = ee214b_defaults('mos180', 300);

c.vdd = 1.8;
c.overall_gain_cl = 720;
c.total_current = 10.1e-3;
c.input_noise = 20e-12;
c.c_l = 20e-15;
c.gamma = 0.85;
c.c_d = 200e-15;
c.loop_gain = 2;

c.gm_id.m1 = 8;
c.gm_id.m2 = 11;
c.gm_id.m3 = 10.5;
c.gm_id.mbias = 4.0;

c.bias_l = 0.18;

c.gm.m1 = 3.75e-3;
c.gm.m2 = 12e-3;

c.rgc.a = 5;

end