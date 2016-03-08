function d = c_par_for_resistor(d,c,r,i)

c.c_a = 100e-18 ;   % F/um^2 
c.J = 1e-3 ;        % 1mA/1um
c.r_sq_poly = 8.3 ; % sq/ohm

d.r_par.r = r;
d.r_par.w = i / c.J ;
d.r_par.l = d.r_par.r * d.m1.id * c.J / c.r_sq_poly ;
d.r_par.c_par = c.c_a * d.r_par.w * d.r_par.l ; 

end

