function d = check_saturation(d, c)



d.m1 = check_trans_sat(d.m1);
d.m2 = check_trans_sat(d.m2);
d.m3 = check_trans_sat(d.m3);

d.mb1 = check_trans_sat(d.mb1);
d.mb2 = check_trans_sat(d.mb2);


d.all_sat = d.m1.sat_ok && d.m2.sat_ok && d.m3.sat_ok &&...
            d.mb1.sat_ok && d.mb2.sat_ok;

end