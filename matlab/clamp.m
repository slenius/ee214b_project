function v = clamp(v, hi, lo)
    v = min(hi, max(lo, v));
end