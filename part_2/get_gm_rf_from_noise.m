function  d = get_gm_rf_from_noise(d, constraints )
%Distributes noise equally among all three components
    d.noise.r_f  = constraints.noise(1) ;
    d.noise.m1   = constraints.noise(2) ;
    d.noise.mb1  = constraints.noise(3) ;
    d.r_f = 4*constraints.k*constraints.T/d.noise.r_f ;
    d.m1.gm = d.noise.m1/(4*constraints.k*constraints.T*constraints.gamma) ;
    d.mb1.gm = d.noise.mb1/(4*constraints.k*constraints.T*constraints.gamma) ;
    
end

