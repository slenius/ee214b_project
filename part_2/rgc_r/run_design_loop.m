function d = run_design_loop(d, c, nch, pch)
    d.r_2 = c.rgc.a / c.gm.m2;
    d.r_1 = c.overall_gain_cl / d.a_v_cd;
    d = get_trans_sizes(d, c, nch, pch);
    d = get_node_voltages(d, c);
    
    d = c_par_for_resistor(d,c,d.r_1,d.m1.id);
    d.c_r_1 = d.r_par.c_par/2;
    
    d = c_par_for_resistor(d,c,d.r_2,d.m2.id);
    d.c_r_2 = d.r_par.c_par/2;
    
    d = get_time_constants(d, c);
    d = get_cf(d, c);
    
    d.gain = d.a_v_cd * d.r_1;
end