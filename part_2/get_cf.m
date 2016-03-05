function d = get_cf(d, c)
d.c_f = 20e-15;

p = sort(-d.poles_w);

d.w_u = (d.t_0 * p(1) * p(2) * p(3))^(1/3);
d.f_u = d.w_u / (2 * pi);

d.w_z = 1 / sqrt(2) * d.w_u;

d.c_f = 1 / (d.w_z * d.r_f);

d.c_f = d.c_f;
end