function d = get_node_voltages(d, c)
    d.v_x = c.vdd - (d.r_1 * d.m1.id);
    d.v_w = c.vdd - (d.r_2 * d.m2.id);
    
    d.v_b = d.mb1.vgs;
    
    d.v_o = d.v_w - d.m4.vgs;
    d.v_in = d.v_o;
    
    d.v_g = d.v_in + d.m1.vgs;
    
    d.v_z = d.v_x - d.m2.vgs;
    d.v_y = d.v_z + d.m2.vov + .1;
    d.v_c = d.v_y + d.m3.vgs;
    %d.v_y = c.v_c - d.m3.vgs;
    
   
    d.m1.vds = d.v_x - d.v_in;
    d.m2.vds = d.v_y - d.v_z;
    d.m3.vds = d.v_w - d.v_y;
    d.m4.vds = c.vdd - d.v_o;
    
    d.mb1.vds = d.v_in;
    d.mb2.vds = d.v_z;
    d.mb3.vds = d.v_o;
    
    if(d.v_in < 0 || d.v_in > c.vdd)
       warning('Vin out of range!'); 
    end
    
    


end