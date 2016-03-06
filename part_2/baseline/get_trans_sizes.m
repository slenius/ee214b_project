function d = get_trans_sizes_from_gm_id_current(d, c, nch, pch)

% preload with estimated values
d.m1.vsb = 0.5;
d.m2.vsb = 0.5;
d.m3.vsb = 0.75;
d.m4.vsb = 0.5;

d.mb3.vsb = 0;
d.mb4.vsb = 0;

d.m1 = get_transistor_parameters(d.m1, nch);
d.m2 = get_transistor_parameters(d.m2, nch);
d.m3 = get_transistor_parameters(d.m3, nch);
d.m4 = get_transistor_parameters(d.m4, nch);

d.mb3 = get_transistor_parameters(d.mb3, nch);
d.mb4 = get_transistor_parameters(d.mb4, nch);




end