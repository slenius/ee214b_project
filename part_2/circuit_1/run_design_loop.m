function design = run_design_loop(design, constraints, nch, pch)
    design = get_af_from_rf_and_acl(design, constraints);
    design = get_gm_rf_from_noise(design, constraints); 
    design = get_trans_sizes_from_gm_id_current(design,constraints, nch, pch);
    design = get_r1_r2_from_ratio(design, constraints);
    design = get_node_voltages(design, constraints);
    design = get_time_constants(design, constraints);
    design = get_cf(design, constraints);
end