
function write_rgc_file(d, c)

f_name = 'matlab.sp';

f = fopen(f_name, 'w');
fprintf(f, '* Autogenerated spice file from design_project.m\n');
fprintf(f, '\n');
fprintf(f, '* ee114 device models\n');
fprintf(f, '.include /usr/class/ee214/hspice/ee214_hspice.sp\n');

fprintf(f, '\n');
fprintf(f, 'r1  n_vdd n_o   %0.1f\n', d.r_1);
fprintf(f, 'rb n_vdd n_v   %0.1f\n', d.r_b);
%fprintf(f, 'rf  n_ox  n_i   %0.1f\n', d.r_f);

fprintf(f, '\n');
fprintf(f, 'cd        n_i   0   %0.1ff\n', c.c_d*1e15);
fprintf(f, 'cl        n_o   0   %0.1ff\n', c.c_l*1e15);
fprintf(f, 'cb        n_b   0   1');

fprintf(f, '\n');
fprintf(f, 'm1    n_o   n_vx  n_i   0     nmos214       w=%0.1fu l=%0.2fu\n', d.m1.w, d.m1.l);
fprintf(f, 'm2    n_v   n_i   0     0     nmos214       w=%0.1fu l=%0.2fu\n', d.m2.w, d.m2.l);

fprintf(f, '\n');
fprintf(f, 'mb1   n_i   n_b   0     0     nmos214       w=%0.1fu l=%0.2fu\n', d.mb1.w, d.mb1.l);

fprintf(f, '\n');
fprintf(f, 'vdd   n_vdd   0     %0.1f\n', c.vdd);
fprintf(f, 'vx    n_v     n_vx  0\n');

fprintf(f, 'is    n_i     0   DC=0  AC=1\n');

fprintf(f, 'ib    n_vdd   n_b %0.3fu\n', d.mb9.id*1e6);
fprintf(f, 'mb4   n_b     n_b   0     0     nmos214       w=%0.1fu l=%0.2fu\n', d.mb9.w, d.mb9.l);

fprintf(f, '.op\n');
fprintf(f, '.ac dec 1000 1e3 1000e9\n');
fprintf(f, '.lstb mode=single vsource=vx\n');
fprintf(f, '.probe ac lstb(db) lstb(p)\n');
fprintf(f, '.pz v(n_o) is\n');
fprintf(f, '.noise v(n_o) is\n');
fprintf(f, '.option post brief accurate\n');
fprintf(f, '.end\n');

end