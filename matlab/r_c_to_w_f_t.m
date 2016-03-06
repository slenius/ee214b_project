function obj = r_c_to_w_f_t(obj)
obj.t = obj.r * obj.c;
obj.w = 1/obj.t;
obj.f = obj.w / (2 * pi);
end