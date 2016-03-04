function m = get_transistor_parameters(m, v_sb, data)

m.wt = lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l, 'VSB', v_sb, 'VGS', v_sb:0.01:1.8);
m.ft = m.wt  /(2 * pi);
m.gmb = m.gm * lookup(data, 'GMB_GM', 'GM_ID', m.gm_id, 'L', m.l, 'VSB', v_sb, 'VGS', v_sb:0.01:1.8);

m.gm_prime = m.gm + m.gmb;

m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l, 'VSB', v_sb, 'VGS', v_sb:0.01:1.8);

vt_vec = [0.4851 0.5117 0.5371 0.5616 0.5852 0.6081 0.6303 0.6518 0.6728 0.6933 0.7132];
vsb_vec = 0:0.1:1;
m.vt = interp1(vsb_vec, vt_vec, v_sb);
%m.vt = m.gm * lookup(data, 'VT_GM', 'GM_ID', m.gm_id, 'L', m.l, 'VSB', v_sb, 'VGS', v_sb:0.01:1.8);

m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l, 'VSB', v_sb, 'VGS', v_sb:0.01:1.8);

if(m.w > 200)
    msg = sprintf('Transistor %s is bigger then 200um! (%0.1f)', m.name, m.w);
    warning(msg)
end

m.cgg = m.gm / m.wt;
m.cgd = m.cgg * lookup(data, 'CGD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdd = m.cgg * lookup(data, 'CDD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.css = m.cgg * lookup(data, 'CSS_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdb = m.cdd - m.cgd;
m.cgs = m.cgg - m.cgd;

m.v_sb = v_sb;

m.vov = 2 / m.gm_id;
m.vgs = m.vov + m.vt;


end