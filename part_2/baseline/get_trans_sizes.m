function d = get_trans_sizes_from_gm_id_current(d, c, nch, pch)

d.m1 = get_transistor_parameters(d.m1, nch, 0);
d.m2 = get_transistor_parameters(d.m2, nch, 0.9);
d.m3 = get_transistor_parameters(d.m3, nch, 0.9);
d.m4 = get_transistor_parameters(d.m4, nch, 0.9);

d.mb3 = get_transistor_parameters(d.mb3, nch, 0);
d.mb4 = get_transistor_parameters(d.mb4, nch, 0);




end