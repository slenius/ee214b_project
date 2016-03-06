function d = get_af_from_rf_and_acl(d, c)
    % Using Acl = a / (1 + af) get a_0, f_0, and t_0
    
    d.t_0 = c.loop_gain;
    d.a_cl = -c.overall_gain_cl;
    
    d.a_0 = d.a_cl * (1 + d.t_0);
    d.f_0 = d.t_0 / d.a_0;
    d.r_f = -1 / d.f_0;
    
    %d.f_0 = -1 / d.r_f;
    %d.a_cl = -c.overall_gain_cl;
    
    %d.a_0 = d.a_cl / (1 - d.a_cl * d.f_0);
    %d.t_0 = d.a_0 * d.f_0;
    
end