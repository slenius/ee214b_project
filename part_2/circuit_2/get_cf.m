function d = get_cf(d, c)
p = sort(-d.poles_w);

d.w_u = (d.t_0 * p(1) * p(2))^(1/2);
d.f_u = d.w_u / (2 * pi);

d.w_0 = sqrt((1 + d.t_0) * p(1) * p(2));

d.w_z = d.w_0 / (sqrt(2) - (p(1) + p(2))/d.w_0);

d.c_f = 1 / (d.w_z * d.r_f);

d.c_f = clamp(d.c_f, 1, 0);
d.c_f = 0;

d.f_u = d.w_u / (2 * pi);
d.f_z = d.w_z / (2 * pi);
d.f_cl = d.f_u * sqrt(2);

end