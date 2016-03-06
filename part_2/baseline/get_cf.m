function d = get_cf(d, c)

d.w_u = (d.t_0 * d.t_in.w * d.t_x.w)^(1/2);


d.w_0 = sqrt((1 + d.t_0) * d.t_in.w * d.t_x.w);


%d.w_z = d.w_u / sqrt(2);

d.w_z = d.w_0 / (sqrt(2) - (d.t_in.w + d.t_x.w)/d.w_0);

d.c_f = 1 / (d.w_z * d.r_f);

d.c_f = clamp(d.c_f, 1, 0);

d.f_u = d.w_u / (2 * pi);
d.f_z = d.w_z / (2 * pi);
d.f_cl = d.f_u * sqrt(2);

end