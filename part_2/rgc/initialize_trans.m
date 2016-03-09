function d = initialize_trans(d, c, nch, pch)

d.a_v_cd = 0.8;
d.r_1 =  c.overall_gain_cl / d.a_v_cd;

d.m1.l = 0.18;
d.m2.l = 0.18;
d.m3.l = 0.18;

d.mb1.l = c.bias_l;
d.mb2.l = c.bias_l;
d.mb3.l = c.bias_l;

d.mb9.l = c.bias_l;
d.mb10.l = c.bias_l;
d.mb11.l = c.bias_l;

d.m1.gm_id = c.gm_id.m1;
d.m2.gm_id = c.gm_id.m2;
d.m3.gm_id = c.gm_id.m3;

d.m1.gm = c.gm.m1;
d.m2.gm = c.gm.m2;
d.m3.gm = 1 / d.r_1;

d.m1.id = d.m1.gm / d.m1.gm_id;
d.m2.id = d.m2.gm / d.m2.gm_id;
d.m3.id = d.m3.gm / d.m3.gm_id;

d.mb1.gm_id = c.gm_id.mbias ;
d.mb1.id = d.m1.id;

d.mb2.gm_id = c.gm_id.mbias ;
d.mb2.id = d.m3.id;

d.mb3.gm_id = c.gm_id.mbias ;
d.mb3.id = d.m2.id;

d.mb9.gm_id = c.gm_id.mbias ;
d.mb9.id = d.mb1.id;

d.mb10_id = c.gm_id.mbias ;
d.mb10.id = d.mb1.id;

d.mb11.gm_id = c.gm_id.mbias ;
d.mb11.id = d.mb1.id;

d.m1.name = 'm1';
d.m1.type = 'nch';

d.m2.name = 'm2';
d.m2.type = 'nch';

d.m3.name = 'm3';
d.m3.type = 'pch';

d.mb1.name = 'mb1';
d.mb1.type = 'nch';

d.mb2.name = 'mb2';
d.mb2.type = 'nch';

d.mb3.name = 'mb3';
d.mb3.type = 'nch';

d.mb9.name = 'mb9';
d.mb9.type = 'nch';

d.mb10.name = 'mb10';
d.mb10.type = 'nch';

d.mb11.name = 'mb11';
d.mb11.type = 'pch';




end