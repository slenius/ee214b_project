function warn_voltage(name, volt, hi, lo)
if(volt <= lo) 
    warning('%s too low!: %f', name, volt)
end
if(volt >= hi) 
    warning('%s too high!: %f', name, volt)
end
end