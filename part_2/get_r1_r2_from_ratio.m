function d = get_r1_r2_from_ratio(d, c)

% gain equation:
% a = (gm1*rf)/(1 + gm1*rf) * r1 * gm2 * r2 * (gm3)/(1+gm3*rf)

d.a_i_0 = d.m1.gm * d.r_f / ( 1 + d.m1.gm * d.r_f);
d.a_v_3 = d.m3.gm * d.r_f / ( 1 + d.m3.gm * d.r_f);

d.r_1 = sqrt((d.a_0 * c.r1_r2_ratio) / (d.a_i_0 * d.m2.gm * d.a_v_3));
d.r_2 = d.r_1 / c.r1_r2_ratio;

end