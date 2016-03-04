function m = check_trans_sat(m)

if(m.vov > m.vds)
    msg = sprintf('transistor %s not in saturation!', m.name);
    warning(msg);
end


end