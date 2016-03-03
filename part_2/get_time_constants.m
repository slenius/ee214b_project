function d = get_time_constants(d,c )
    
    d.t_in.r = parallel_r(1/d.m1.gm, d.r_f);
    d.t_in.c = d.cd + d.m1.cdd  + d.m1.css +d.cf ;
    d.t_in.t = d.t_in.r*d.t_in.c ;
    
    d.t_x.r = d.r_1 ;
    d.t_x.c = d.m1.cdd + d.m2.cgg;
    d.t_x.t = d.t_x.r*d.t_x.c ;
    
    d.t_w.r = d.r_2 ;
    d.t_w.c = d.m3.cdd + d.m4.cgd + d.m4.cgs/(1+d.m4.gm*d.r_f);
    d.t_w.t = d.t_w.r*d.t_w.c ;
    
    d.t_o.r = parallel_r(1/d.m4.gm, d.r_f);
    d.t_o.c = d.m3.cdd + d.cl + d.cf + d.m4.css ;
    d.t_o.t = d.t_o.r*d.t_o.c ;
        


end

