function d = initialize_trans(d, c, nch, pch)

d.m1.l = 0.18;
d.m2.l = 0.18;

d.mb1.l = 0.36;
d.mb9.l = 0.36;

d.m1.gm_id = 8;
d.m2.gm_id = 8;

d.m1.gm = 5e-3;
d.m2.gm = 5e-3;

d.m1.id = d.m1.gm / d.m1.gm_id;
d.m2.id = d.m2.gm / d.m2.gm_id;

d.mb1.gm_id = 3;
d.mb1.id = d.m1.id;

d.mb9.gm_id = 3;
d.mb9.id = d.mb1.id;

d.m1.name = 'm1';
d.m2.name = 'm2';

d.mb1.name = 'mb1';
d.mb9.name = 'mb9';


end