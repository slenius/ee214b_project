function  d = get_gm_rf_from_noise(d, c )
%Distributes noise equally among all three components

    d.noise.r_f  = 4*c.k*c.T/d.r_f;
    noise_budget = c.input_noise^2 - d.noise.r_f;
    c.noise = noise_budget .* c.input_noise_dist;
    
    d.noise.m1   = c.noise(1) ;
    d.noise.mb1  = c.noise(2) ;
    
    d.m1.gm = d.noise.m1/(4*c.k*c.T*c.gamma);
    d.mb1.gm = d.noise.mb1/(4*c.k*c.T*c.gamma);

    d.m1.id = d.m1.gm / d.m1.gm_id;
    d.mb1.id = d.mb1.gm / d.mb1.gm_id;

    %d.noise.r_f  = constraints.noise(1) ;
    %d.noise.m1   = constraints.noise(2) ;
    %d.noise.mb1  = constraints.noise(3) ;
    %d.r_f = 4*constraints.k*constraints.T/d.noise.r_f ;
    %d.m1.gm = d.noise.m1/(4*constraints.k*constraints.T*constraints.gamma) ;
    %d.mb1.gm = d.noise.mb1/(4*constraints.k*constraints.T*constraints.gamma) ;
    
end

