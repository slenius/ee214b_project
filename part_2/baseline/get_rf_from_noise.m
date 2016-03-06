function  d = get_gm_rf_from_noise(d, c )
    d.r_f = 4*c.k*c.T / c.input_noise;

end

