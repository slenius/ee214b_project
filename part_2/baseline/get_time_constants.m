function d = get_time_constants(d,c )
    if not(isfield(d, 'c_f'))
        d.c_f = 0;
    end
    
    d.t_in.r = d.r_f;
    d.t_in.c = c.c_d + d.m1.cgs + d.c_f;

    d.t_x.r = d.r_c2 ;
    
    Gm4 = d.m4.gm / (1 + d.m4.gm * d.r_e4);
    
    d.t_x.c = d.m3.cgd + d.m2.cdd + d.m4.cgd * (1 + Gm4*d.r_c4)...
        + d.m3.cgs * (1 - (d.m3.gm * d.r_f / (1 + d.m3.gm * d.r_f)))...
        + d.m4.cgs * (1 - (d.m4.gm * d.r_c4 / (1 + d.m4.gm * d.r_c4)));
    
    d.t_o.r = d.r_c4;
    d.t_o.c = c.c_l + d.m4.cgd * (1 + 1 / (d.m4.gm * d.r_c4)) + d.m4.cdb;
        
    d.t_in = r_c_to_w_f_t(d.t_in);
    d.t_x = r_c_to_w_f_t(d.t_x);
    d.t_o = r_c_to_w_f_t(d.t_o);
        
    d.poles_w = -1 .* [d.t_in.w d.t_x.w d.t_o.w];
    d.poles_f = d.poles_w ./ (2 * pi);
    
    d.t_sum = d.t_in.t + d.t_x.t + d.t_o.t;
    d.bw = (1 + d.t_0) / (2 * pi * d.t_sum);
    
end

