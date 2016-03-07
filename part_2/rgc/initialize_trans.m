function d = initialize_trans(d, c, nch, pch)

d.m1.l = 0.18;
d.m2.l = 0.18;
d.m3.l = 0.18;

d.mb1.l = 0.36;
d.mb2.l = 0.36;
d.mb9.l = 0.36;

d.m1.gm_id = c.gm_id.m1;
d.m2.gm_id = c.gm_id.m2;
d.m3.gm_id = c.gm_id.m3;

d.m1.gm = c.gm.m1;
d.m2.gm = c.gm.m2;
d.m3.gm = c.gm.m3;

d.m1.id = d.m1.gm / d.m1.gm_id;
d.m2.id = d.m2.gm / d.m2.gm_id;
d.m3.id = d.m3.gm / d.m3.gm_id;


d.mb1.gm_id = c.gm_id.mbias ;
d.mb1.id = d.m1.id;

d.mb2.gm_id = c.gm_id.mbias ;
d.mb2.id = d.m3.id;

d.mb9.gm_id = c.gm_id.mbias ;
d.mb9.id = d.mb1.id;

d.m1.name = 'm1';
d.m2.name = 'm2';
d.m3.name = 'm3';

d.mb1.name = 'mb1';
d.mb2.name = 'mb2';
d.mb9.name = 'mb9';


end