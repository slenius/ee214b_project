function d = get_trans_sizes_from_gm_id_current(d, c, nch, pch)

d.m1 = get_transistor_parameters(d.m1, 0.5, nch);
d.m2 = get_transistor_parameters(d.m2, 0.5, nch);
d.m3 = get_transistor_parameters(d.m3, 0.75, nch);
d.m4 = get_transistor_parameters(d.m4, 0.5, nch);

d.mb1 = get_transistor_parameters(d.mb1, 0.0, nch);
d.mb2 = get_transistor_parameters(d.mb2, 0.0, nch);
d.mb3 = get_transistor_parameters(d.mb3, 0.0, nch);




end