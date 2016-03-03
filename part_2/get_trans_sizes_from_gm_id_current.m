function d = get_trans_sizes_from_gm_id_current(d, c, nch, pch)

d.m1 = get_transistor_parameters(d.m1, nch);
d.m2 = get_transistor_parameters(d.m2, nch);
d.m3 = get_transistor_parameters(d.m3, nch);
d.m4 = get_transistor_parameters(d.m4, nch);

end