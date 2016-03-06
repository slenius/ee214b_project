function d = check_saturation(d, c)

d.m1 = check_trans_sat(d.m1);
d.m2 = check_trans_sat(d.m2);
d.m3 = check_trans_sat(d.m3);
d.m4 = check_trans_sat(d.m4);

d.mb3 = check_trans_sat(d.mb3);
d.mb4 = check_trans_sat(d.mb4);

d.all_sat = d.m1.sat_ok && d.m2.sat_ok && d.m3.sat_ok && d.m4.sat_ok &&...
            d.mb3.sat_ok && d.mb4.sat_ok;

end