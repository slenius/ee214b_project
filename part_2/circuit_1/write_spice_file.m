function write_spice_file(d, c)

f_name = 'matlab.sp';

f = fopen(f_name, 'w');
fprintf(f, '* Autogenerated spice file from design_project.m\n');
fprintf(f, '\n');
fprintf(f, '* ee114 device models\n');
fprintf(f, '.include /usr/class/ee214/hspice/ee214_hspice.sp\n');


fprintf(f, 'rc2  n_vdd n_x   %0.1f\n', d.r_c2);
fprintf(f, 'rc4  n_vdd n_o   %0.1f\n', d.r_c4);
fprintf(f, 're4  n_z   n_ze  %0.1f\n', d.r_e4);
fprintf(f, 'rf   n_yx  n_i   %0.1f\n', f.r_f);


fprintf(f, 'cl        n_o   0   20f\n');
fprintf(f, 'cd        n_i   0   200f\n');
fprintf(f, 'c_magic   n_ze  0   1.0\n');
fprintf(f, 'cf        n_yx  n_i %0.1ff\n', d.c_f * 1e15);


fprintf(f, 'm1    n_w   n_i   0     0     nmos214       w=%du l=0.18u\n', d.m1.w);
fprintf(f, 'm2    n_x   n_b   n_w   0     nmos214       w=%du l=0.18u\n', d.m1.w);
fprintf(f, 'm3    n_vdd n_x   n_y   0     nmos214       w=%du l=0.18u\n', d.m1.w);
fprintf(f, 'm4    n_o   n_x   n_z   0     nmos214       w=%du l=0.18u\n', d.m1.w);


fprintf(f, 'vdd   n_vdd   0     1.8\n');
fprintf(f, 'vb    n_b     0     1.8\n');
fprintf(f, 'vx    n_y     n_yx  0\n');

fprintf(f, 'ib3   n_y     0     %0.3fu\n', d.m3.id*1e6);
fprintf(f, 'ib4   n_z     0     %0.3fu\n', d.m4.id*1e6);

fprintf(f, 'is    n_i     0   DC=0  AC=1\n');

fprintf(f, '.op\n');
fprintf(f, '.ac dec 1000 1e3 1000e9\n');
fprintf(f, '.lstb mode=single vsource=vx\n');
fprintf(f, '.probe ac lstb(db) lstb(p)\n');
fprintf(f, '.pz v(n_o) is\n');
fprintf(f, '.noise v(n_o) is\n');
fprintf(f, '.option post brief accurate\n');
fprintf(f, '.end\n');

end
