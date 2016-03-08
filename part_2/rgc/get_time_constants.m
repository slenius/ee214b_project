function d = get_time_constants(d,c )
    if not(isfield(d, 'c_f'))
        d.c_f = 0;
    end
    
    %d.t_in.r = 1 / (d.m1.gm * (1 + d.m2.gm * d.r_b));
    %d.t_in.c = c.c_d + d.m1.cdd  + d.m1.css + d.mb1.cdd + d.m2.cgs + d.m2.cgd*(1+d.m2.gm * d.r_b);

    d.A = 1 + d.m2.gm * parallel_r(d.mb3.ro, d.m2.ro);
    d.B = d.m1.gm * d.r_1;
    d.r_l = parallel_r(d.mb2.ro, d.m3.ro, 1 / d.m3.gmb);
    d.C = d.m3.gm * d.r_l / (1 + d.m3.gm * d.r_l);
    d.a_v_cd = d.C;
     
    %d.t_in.r = 1 / (d.m1.gm) * 1/(1 + d.A);
    d.t_in.r = 1 / (d.m1.gm);
    d.t_in.c = c.c_d + d.mb1.cdd + d.m1.csb + d.m2.cgs + (d.m1.cgs + d.m2.cgd + d.c_f)*(1 + d.A);
    
    d.t_v.r = parallel_r(d.mb3.ro, d.m2.ro);
    d.t_v.c = (d.m1.cgs + d.m2.cgd + d.c_f)*(1+1/d.A) + d.m2.cdb + d.mb3.cdd;
    
    d.t_x.r = parallel_r(d.r_1, d.m1.ro);
    d.t_x.c = d.m1.cdb + d.m1.cgd + d.m1.cgd*(1+1/d.B) + d.m3.cgd + d.m3.cgs*(1-d.C) + d.c_r_1;
    
    d.t_o.r = parallel_r(1/d.m3.gm, d.r_l);
    d.t_o.c = d.m3.cdd + c.c_l + d.m3.cgs + d.m3.csb;
        
    d.t_in = r_c_to_w_f_t(d.t_in);
    d.t_v = r_c_to_w_f_t(d.t_v);
    d.t_x = r_c_to_w_f_t(d.t_x);
    d.t_o = r_c_to_w_f_t(d.t_o);
        
    d.poles_w = -1 .* [d.t_in.w d.t_v.w d.t_x.w d.t_o.w];
    d.poles_f = d.poles_w ./ (2 * pi);
    
    d.t_sum = d.t_in.t + d.t_x.t + d.t_o.t;
    d.bw = 1 / (2 * pi * d.t_sum);
    
end