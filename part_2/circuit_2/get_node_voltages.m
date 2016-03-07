function d = get_node_voltages(d, c)
    d.v_x = c.vdd - (d.r_1 * d.m1.id);
    d.v_w = c.vdd - (d.r_2 * d.m2.id);
    d.v_v = c.vdd - (d.r_rgc * d.m5.id);
    
    d.v_b = d.mb1.vgs;
    
    d.v_o = d.v_w - d.m4.vgs;
    d.v_in = d.v_v - d.m1.vgs;
    
    d.v_g = d.v_in + d.m1.vgs;
    
    d.v_z = d.v_x - d.m2.vgs;
    d.v_y = d.v_z + d.m2.vov;
    d.v_c = d.v_y + d.m3.vgs;
    
    min_vds = 3 * c.v_t;
   
    d.m1.vds = clamp(d.v_x - d.v_in, c.vdd, min_vds);
    d.m1.vsb = clamp(d.v_in, c.vdd, 0);
    
    d.m2.vds = clamp(d.v_y - d.v_z, c.vdd, min_vds);
    d.m2.vsb = clamp(d.v_z, c.vdd, 0);
    
    d.m3.vds = clamp(d.v_w - d.v_y, c.vdd, min_vds);
    d.m3.vsb = clamp(d.v_y, c.vdd, 0);
    
    d.m4.vds = clamp(c.vdd - d.v_o, c.vdd, min_vds);
    d.m4.vsb = clamp(d.v_o, c.vdd, 0);
    
    d.m5.vds = clamp(d.v_v, c.vdd, min_vds);
    
    d.mb1.vds = clamp(d.v_in, c.vdd, min_vds);
    d.mb2.vds = clamp(d.v_z, c.vdd, min_vds);
    d.mb3.vds = clamp(d.v_o, c.vdd, min_vds);    
    

    
end