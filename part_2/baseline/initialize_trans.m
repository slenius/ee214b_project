function d = initialize_trans(d, c)

d.m1.l = 0.18;
d.m2.l = 0.18;
d.m3.l = 0.18;
d.m4.l = 0.18;

d.mb3.l = 0.36;
d.mb4.l = 0.36;
    
d.m1.gm_id = c.gm_id(1);
d.m2.gm_id = c.gm_id(2);
d.m3.gm_id = c.gm_id(3);
d.m4.gm_id = c.gm_id(4);
d.mb3.gm_id = c.gm_id(5);
d.mb4.gm_id = c.gm_id(5);


d.m1.id = c.stage_id(1);
d.m2.id = c.stage_id(1);

d.m3.id = c.stage_id(2);
d.mb3.id = c.stage_id(2);

d.m4.id = c.stage_id(3);
d.mb4.id = c.stage_id(3);

d.m1.gm = d.m1.gm_id * d.m1.id;
d.m2.gm = d.m2.gm_id * d.m2.id;
d.m3.gm = d.m3.gm_id * d.m3.id;
d.m4.gm = d.m4.gm_id * d.m4.id;

d.mb3.gm = d.mb3.gm_id * d.mb3.id;
d.mb4.gm = d.mb4.gm_id * d.mb4.id;

d.m1.name = 'm1';
d.m2.name = 'm2';
d.m3.name = 'm3';
d.m4.name = 'm4';

d.mb3.name = 'mb3';
d.mb4.name = 'mb4';


end