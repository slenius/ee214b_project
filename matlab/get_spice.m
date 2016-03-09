function d = get_spice(d, c)


h = loadsig('matlab.ac0');


f = evalsig(h,'HERTZ');
t_mag = evalsig(h,'lstb_db');
t_phase = evalsig(h,'lstb_phase') - 180;

inoise = evalsig(h,'innoise');
onoise = evalsig(h,'outnoise');

hostname = char(getHostName(java.net.InetAddress.getLocalHost));
if findstr('google', hostname)
  vo_cmplx = evalsig(h,'n_o');
else
  vo_cmplx = evalsig(h,'v_n_o');
end

vo_mag = 20 * log10(abs(vo_cmplx));
vo_phase = 180/pi * unwrap(angle(vo_cmplx));


unity_index = find(abs(t_mag) == min(abs(t_mag)));
t_u_spice = f(unity_index);

t_180_spice_index = find(abs(t_phase+180) == min(abs(t_phase+180)));

t_180_spice = f(t_180_spice_index);



d.spice_f_cl = min(f(vo_mag<=vo_mag(1)-3));
d.spice_a_cl = vo_mag(1);

d.spice_gain_peaking = max(vo_mag) - vo_mag(1);
d.spice_inoise_3db = sqrt(min(inoise((vo_mag<=vo_mag(1)-3))));

end
