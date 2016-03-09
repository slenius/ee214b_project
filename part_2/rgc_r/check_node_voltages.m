function d = check_node_voltages(d, c)

hi_v = c.vdd - 0.3;
lo_v = 0.3;

warn_voltage('v_in', d.v_in, hi_v, lo_v);
warn_voltage('v_v', d.v_x, hi_v, lo_v);
warn_voltage('v_x', d.v_x, hi_v, lo_v);
warn_voltage('v_bn', d.v_bn, c.vdd, lo_v);
warn_voltage('v_o', d.v_o, hi_v, lo_v);




end