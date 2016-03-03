function m = get_transistor_parameters(m, data)

m.wt = lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.ft = m.wt  /(2 * pi);
m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l);

m.vt = m.gm / lookup(data, 'GM_VT', 'GM_ID', m.gm_id, 'L', m.l);

m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l);

m.cgg = m.gm / m.wt;
m.cgd = m.cgg * lookup(data, 'CGD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdd = m.cgg * lookup(data, 'CDD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdb = m.cdd - m.cgd;
m.cgs = m.cgg - m.cgd;



end