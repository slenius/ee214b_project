function d = get_node_voltages(d, c)
    d.v_x = c.vdd - (d.r_1 * d.m1.id);
    d.v_v = d.m1.vgs + d.m1.vgs;
    
    d.v_bn = d.mb1.vgs;
    d.v_bp = c.vdd - d.mb3.vgs;
    
    d.v_o = d.v_x - d.m3.vgs;
    d.v_in = d.m2.vgs;
        
    min_vds = 3 * c.v_t;
   
    d.m1.vds = clamp(d.v_x - d.v_in, c.vdd, min_vds);
    d.m1.vsb = clamp(d.v_in, c.vdd, 0);
    
    d.m2.vds = clamp(d.v_v, c.vdd, min_vds);
    
    d.m3.vds = clamp(c.vdd - d.v_o, c.vdd, min_vds);
    d.m3.vsb = clamp(d.v_o, c.vdd, 0);    
    
    d.mb1.vds = clamp(d.v_in, c.vdd, min_vds);
    d.mb2.vds = clamp(d.v_o, c.vdd, min_vds);
    d.mb3.vds = clamp(c.vdd - d.v_v, c.vdd, min_vds);
    
end