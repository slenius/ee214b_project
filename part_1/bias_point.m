close all
clear all

c = ee214b_defaults('sige_hbt', 273+25);

v_cc = 2.5;

r_f = 220;
r_c2 = 250;
r_c4 = 100;
r_e4 = 15;

c_d = 200e-15;
c_l = 20e-15;

i_b3 = 4.5e-3;
i_b4 = 2e-3;

v_be = 0.8;
v_b2 = 1.6;

v_in = v_be;
v_w = v_be;
v_y = v_in;
v_x = v_y + v_be;
v_z = v_x - v_be;
v_out = v_cc - r_c4 * i_b4;

q2.i_c = (v_cc - v_x) / r_c2;
q1.i_c = q2.i_c;

q3.i_c = i_b3;
q4.i_c = i_b4;

q1 = calc_bjt(c, q1.i_c, v_in, v_w, 4);
q2 = calc_bjt(c, q2.i_c, v_b2, v_x, 4);
q3 = calc_bjt(c, q3.i_c, v_x, v_cc, 5);
q4 = calc_bjt(c, q4.i_c, v_x, v_out, 3);

stage_0.gain = parallel_r(q1.r_pi, r_f); 
stage_1.gain = -q1.gm * r_c2;

q4.Gm = q4.gm / (1 + r_e4 * q4.gm);

stage_2.gain = -q4.Gm * r_c4;

% values from simulations
q1.c_pi = 110.19e-15;
q1.c_u = 14.10e-15;
q1.gm = 120.73e-3;

q2.c_pi = 109.88e-15;
q2.c_u = 14.037e-15;
q2.gm = 120.346e-3;

q3.c_pi = 138.54e-15;
q3.c_u = 12.80e-15;
q3.gm = 152.257e-3;

q4.c_pi = 67.71e-15;
q4.c_u = 8.04e-15;
q4.gm = 70.032e-3;

stage_0.gain = parallel_r(q1.r_pi, r_f); 
stage_1.gain = -q1.gm * r_c2;

q4.Gm = q4.gm / (1 + r_e4 * q4.gm);

stage_2.gain = -q4.Gm * r_c4;

total_gain = stage_0.gain * stage_1.gain * stage_2.gain;
total_gain_db = 20 * log10(total_gain);



c_x = q2.c_u + q3.c_pi / (1 + q3.gm * r_f) + q4.c_pi / (1 + q4.gm * r_e4) +...
      q3.c_u + q4.c_u * (1 - stage_2.gain);
r_x = parallel_r(r_c2, q3.r_pi * (1 + q3.gm * r_f), q4.r_pi * (1 + q4.gm * r_e4));
    
c_in = c_d + q1.c_pi + q1.c_u;    
r_in = parallel_r(q1.r_pi, r_f);

pole.vi.w = 1 / (r_in * c_in);
pole.vi.f = pole.vi.w / (2 * pi);
pole.vo.w = 1 / (r_c4 * c_l);
pole.vo.f = pole.vo.w / (2 * pi);
pole.vx.w = 1 / (r_x * c_x);
pole.vx.f = pole.vx.w / (2 * pi);

a = stage_0.gain * stage_1.gain;
f = -1/r_f;

t = a * f;

a_db = 20*log10(-a);
f_db = 20*log10(-f);
t_db = 20*log10(t);

pole.w_u = sqrt(t * pole.vi.w * pole.vx.w);
pole.pm = pi - atan(pole.w_u / pole.vi.w) - atan(pole.w_u / pole.vx.w);
pole.pm_deg = pole.pm * 180/pi;
pole.f_u = pole.w_u / (2 * pi);

a_v3 = q3.gm * r_f / (1 + q3.gm * r_f);

k = r_in * q1.gm * r_x * a_v3 / r_f;

w_o = sqrt((1+k) / (r_in * c_in * r_x * c_x));
f_o = w_o / (2 * pi);
q_w = (1+k) / (r_in * c_in + r_x *c_x);
q = q_w / w_o;


% part f
p = [1/w_o^2, 1/q_w, 1];
r = roots(p);

real_pole = real(r(1)/(2 *pi));
imag_pole = imag(r(1)/(2 *pi));

% part i
f_o = 1.7443184E+10;
w_o = f_o * 2 * pi;
%w_z = w_o / sqrt(2);
w_z = w_o / (sqrt(2) - (pole.vi.w + pole.vx.w) / w_o);
c_z = 1 / (w_z * r_f);

c_in_z = c_in + c_z;
cl_3db_w = sqrt((1+k) / (r_in * c_in_z * r_x * c_x));
cl_3db_f = cl_3db_w / (2 * pi);

% part k - noise analysis

noise.r_f = 4 * c.k * c.T / r_f;
noise.i_b = 2 * c.q * q1.i_b;
noise.i_c = 2 * c.q * q1.i_c / q1.beta^2;

noise.i_in_sq = noise.r_f + noise.i_b + noise.i_c;
noise.i_in = sqrt(noise.i_in_sq);
