function d = get_time_constants(d,c )
    if not(isfield(d, 'c_f'))
        d.c_f = 0;
    end
    d.t_in.r = parallel_r(1/d.m1.gm_prime, d.r_f);
    d.t_in.c = c.c_d + d.m1.cdd  + d.m1.css + d.c_f + d.mb1.cdd;

    d.t_x.r = d.r_1 ;
    d.t_x.c = d.m1.cdd + d.m2.cgg;
    
    d.t_w.r = d.r_2 ;
    d.t_w.c = d.m3.cdd + d.m4.cgd + d.m4.cgs/(1 + d.m4.gm * d.r_f);
    
    d.t_y.r = 1 / d.m3.gm;
    d.t_y.c = d.m3.css + d.m2.cdb;
    
    d.t_o.r = parallel_r(1/d.m4.gm_prime, d.r_f);
    d.t_o.c = d.m3.cdd + c.c_l + d.c_f + d.m4.css + d.mb3.cdd;
        
    d.t_in = r_c_to_w_f_t(d.t_in);
    d.t_w = r_c_to_w_f_t(d.t_w);
    d.t_x = r_c_to_w_f_t(d.t_x);
    d.t_y = r_c_to_w_f_t(d.t_y);
    d.t_o = r_c_to_w_f_t(d.t_o);
        
    d.poles_w = -1 .* [d.t_in.w d.t_w.w d.t_x.w d.t_y.w d.t_o.w];
    d.poles_f = d.poles_w ./ (2 * pi);
    
    d.t_sum = d.t_in.t + d.t_w.t + d.t_x.t + d.t_y.t + d.t_o.t;
    d.bw = (1 + d.t_0) / (2 * pi * d.t_sum);
    
end

