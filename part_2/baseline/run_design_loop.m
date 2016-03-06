function d = run_design_loop(d, c, nch, pch)
    
    d.r_e4 = c.r_e4;
    d.v_b = 1.8;

    d = get_af_from_rf_and_acl(d, c);
    d = get_trans_sizes(d,c, nch, pch);
    
    d = get_rc2_rc4_from_ratio(d, c);
    d = get_node_voltages(d, c);
    d = get_time_constants(d, c);
    d = get_cf(d, c);
end