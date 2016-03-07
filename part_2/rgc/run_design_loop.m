function d = run_design_loop(d, c, nch, pch)

    d.r_b = c.rgc.a / d.m2.gm;
    d = get_trans_sizes(d, c, nch, pch);

    d.a_v_cd = d.m3.gm_prime * parallel_r(d.m3.ro, d.mb2.ro) / (1 + d.m3.gm_prime * parallel_r(d.m3.ro, d.mb2.ro));

    d = get_node_voltages(d, c);
    d = get_time_constants(d, c);
    d.gain = parallel_r(d.r_1, d.m1.ro) * d.a_v_cd;
end