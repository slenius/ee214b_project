function m = get_transistor_parameters(m, data, vsbinit)



% intializing for looping
if not(isfield(m, 'vsb'))
    m.vsb = vsbinit;
end
if not(isfield(m, 'vds'))
    m.vds = 0.9;
end
if not(isfield(m, 'vgs'))
    m.vgs = 0.9;
end

m.gm = m.gm_id * m.id;

m.wt = lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l, 'VDS', m.vds, 'VSB', m.vsb, 'VGS', m.vsb:0.01:1.8);
if length(m.wt) ~= 1
    m.wt = lookup(data, 'GM_CGG', 'GM_ID', m.gm_id, 'L', m.l);
end

m.ft = m.wt  /(2 * pi);

m.gmb = m.gm .* lookup(data, 'GMB_GM', 'GM_ID', m.gm_id, 'L', m.l, 'VDS', m.vds, 'VSB', m.vsb, 'VGS', m.vsb:0.01:1.8);
if length(m.gmb) ~= 1
    m.gmb = m.gm * lookup(data, 'GMB_GM', 'GM_ID', m.gm_id, 'L', m.l);
end

m.gm_prime = m.gm + m.gmb;

id_w = lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l, 'VDS', m.vds, 'VSB', m.vsb, 'VGS', m.vsb:0.01:1.8);
if length(id_w) ~= 1
    m.w = m.id / lookup(data, 'ID_W', 'GM_ID', m.gm_id, 'L', m.l);
else
    m.w = m.id / id_w;
end

m.w = round(m.w, 1);

gds_id = lookup(data, 'GDS_ID', 'GM_ID', m.gm_id, 'L', m.l, 'VDS', m.vds, 'VSB', m.vsb, 'VGS', m.vsb:0.01:1.8);
if length(gds_id) ~= 1
  m.gds = m.id * lookup(data, 'GDS_ID', 'GM_ID', m.gm_id, 'L', m.l);
else
  m.gds = m.id * gds_id;
end
m.ro = 1 / m.gds; 

maxw = 500;
if(m.w > maxw)
    msg = sprintf('Transistor %s is bigger then %dum! (%0.1f)', m.name, maxw, m.w);
    warning(msg)
end

m.cgg = m.gm / m.wt;
m.cgd = m.cgg * lookup(data, 'CGD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdd = m.cgg * lookup(data, 'CDD_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.css = m.cgg * lookup(data, 'CSS_CGG', 'GM_ID', m.gm_id, 'L', m.l);
m.cdb = m.cdd - m.cgd;
m.cgs = m.cgg - m.cgd;
m.csb = m.css - m.cgs;

m.vt = lookup(data, 'VT', 'L', m.l, 'VGS', m.vgs, 'VDS', m.vgs, 'VSB', m.vsb);

m.vov = 2 / m.gm_id;
m.vgs = m.vov + m.vt;

m.intrinsic_gain = m.gm * m.ro;

m.w = clamp(m.w, 1000, 0.36);

end