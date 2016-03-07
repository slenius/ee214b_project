function d = initialize_trans(d, c, nch, pch)

d.m1.l = 0.18;
d.m2.l = 0.18;
d.m3.l = 0.18;

d.mb1.l = 0.36;
d.mb2.l = 0.36;
d.mb9.l = 0.36;

d.m1.gm_id = 10;
d.m2.gm_id = 10;
d.m3.gm_id = 10;

d.m1.gm = 5e-3;
d.m2.gm = 5e-3;
d.m3.gm = 2.5e-3;

d.m1.id = d.m1.gm / d.m1.gm_id;
d.m2.id = d.m2.gm / d.m2.gm_id;
d.m3.id = d.m3.gm / d.m3.gm_id;

gm_id_bias = 5;

d.mb1.gm_id = gm_id_bias ;
d.mb1.id = d.m1.id;

d.mb2.gm_id = gm_id_bias ;
d.mb2.id = d.m3.id;

d.mb9.gm_id = gm_id_bias ;
d.mb9.id = d.mb1.id;

d.m1.name = 'm1';
d.m2.name = 'm2';
d.m3.name = 'm3';

d.mb1.name = 'mb1';
d.mb2.name = 'mb2';
d.mb9.name = 'mb9';


end