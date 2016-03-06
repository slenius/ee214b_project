function d = get_node_voltages(d, c)
    d.v_x = c.vdd - (d.r_c2 * d.m1.id);
    d.v_w = d.v_b - d.m2.vgs;
    
    d.v_y = d.v_x - d.m3.vgs;
    d.v_in = d.v_y;
    
    d.v_z = d.v_x - d.m4.vgs;
    d.v_o = c.vdd - d.r_c4 * d.m4.id;
    
    min_vds = 3 * c.v_t;
   
    d.m1.vds = clamp(d.v_w, c.vdd, min_vds);
    d.m1.vsb = 0;
    
    d.m2.vds = clamp(d.v_x - d.v_w, c.vdd, min_vds);
    d.m2.vsb = clamp(d.v_w, c.vdd, 0);
    
    d.m3.vds = clamp(c.vdd - d.v_y, c.vdd, min_vds);
    d.m3.vsb = clamp(d.v_y, c.vdd, 0);
    
    d.m4.vds = clamp(d.v_o - d.v_z, c.vdd, min_vds);
    d.m4.vsb = clamp(d.v_z, c.vdd, 0);

    d.mb3.vds = clamp(d.v_y, c.vdd, min_vds);
    d.mb4.vds = clamp(d.v_z, c.vdd, min_vds); 
    

    
end