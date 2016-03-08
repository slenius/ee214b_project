function d = get_cf(d, c)

r_l = parallel_r(d.m1.ro, d.mb1.ro, 1/d.m1.gmb);
d.a_v_m1cd = d.m1.gm * r_l / (1 + d.m1.gm*r_l);
d.t_0 = d.A * d.a_v_m1cd;
d.r_f = 1 / d.m1.gm;

d.w_u = (d.t_0 * d.t_in.w * d.t_v.w)^(1/2);
d.f_u = d.w_u / (2 * pi);

d.w_0 = sqrt((1 + d.t_0) * d.t_in.w * d.t_v.w);

d.w_z = d.w_0 / (sqrt(2) - (d.t_in.w + d.t_v.w)/d.w_0);

d.c_f = 1 / (d.w_z * d.r_f);

d.c_f = clamp(d.c_f, 1, 0);
d.c_f = 0;

d.f_u = d.w_u / (2 * pi);
d.f_z = d.w_z / (2 * pi);
d.f_cl = d.f_u * sqrt(2);

end