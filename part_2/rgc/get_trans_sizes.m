function d = get_trans_sizes_from_gm_id_current(d, c, nch, pch)

% preload with estimated values
d.m1.vsb = 0.5;
d.m2.vsb = 0.0;
d.m3.vsb = 0.9;

d.mb1.vsb = 0;
d.mb2.vsb = 0;
d.mb9.vsb = 0;

d.m1 = get_transistor_parameters(d.m1, nch);
d.m2 = get_transistor_parameters(d.m2, nch);
d.m3 = get_transistor_parameters(d.m3, nch);

d.mb1 = get_transistor_parameters(d.mb1, nch);
d.mb2 = get_transistor_parameters(d.mb2, nch);
d.mb9 = get_transistor_parameters(d.mb9, nch);



end