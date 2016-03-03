function m = get_transistor_parameters(m, data)

m.wt = lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.ft = m.wt  /(2 * pi);
m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l);

m.cgg = m.gm / lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdd = m.gm / lookup(data, 'GM_CDD', 'GM_ID', m.gm_id, 'L', m.l);
m.css = m.gm / lookup(data, 'GM_CSS', 'GM_ID', m.gm_id, 'L', m.l);
m.vt = m.gm / lookup(data, 'GM_VT', 'GM_ID', m.gm_id, 'L', m.l);

m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l);



end