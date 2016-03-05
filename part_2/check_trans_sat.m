function m = check_trans_sat(m)

if(m.vov > m.vds)
    m.sat_ok = false;
    msg = sprintf('transistor %s not in saturation!', m.name);
    warning(msg);
else
    m.sat_ok = true;
end


end