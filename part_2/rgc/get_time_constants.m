function d = get_time_constants(d,c )
    if not(isfield(d, 'c_f'))
        d.c_f = 0;
    end
    
    %d.t_in.r = 1 / (d.m1.gm * (1 + d.m2.gm * d.r_b));
    %d.t_in.c = c.c_d + d.m1.cdd  + d.m1.css + d.mb1.cdd + d.m2.cgs + d.m2.cgd*(1+d.m2.gm * d.r_b);
    d.t_in.r = 1 / (d.m1.gm);
    d.t_in.c = c.c_d + d.m1.cdd  + d.m1.css + d.mb1.cdd + d.m2.cgs + d.m2.cgd*(1+d.m2.gm * d.r_b);
    
    d.t_v.r = parallel_r(d.r_b, d.m2.ro);
    d.t_v.c = d.m1.cgg + d.m2.cdb;
    
    d.t_x.r = d.r_1;
    d.t_x.c = d.m1.cdd + d.m2.cgd;
    
    d.t_o.r = 1/d.m3.gm_prime;
    d.t_o.c = d.m3.cdd + c.c_l + d.mb2.cdd;
        
    d.t_in = r_c_to_w_f_t(d.t_in);
    d.t_v = r_c_to_w_f_t(d.t_v);
    d.t_x = r_c_to_w_f_t(d.t_x);
    d.t_o = r_c_to_w_f_t(d.t_o);
        
    d.poles_w = -1 .* [d.t_in.w d.t_v.w d.t_x.w d.t_o.w];
    d.poles_f = d.poles_w ./ (2 * pi);
    
    d.t_sum = d.t_in.t + d.t_x.t + d.t_o.t;
    d.bw = 1 / (2 * pi * d.t_sum);
    
end