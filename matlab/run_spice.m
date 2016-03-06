function run_spice()

hostname = char(getHostName(java.net.InetAddress.getLocalHost));
if findstr('google', hostname)
    lic = 'export LM_LICENSE_FILE="31000@license.corp.google.com"; ';
    hspice = '/usr/local/google/edatools/synopsys/hspice/H-2013.03/hspice/bin/hspice ';
else
    lic = 'export LM_LICENSE_FILE="27000@cadlic0"; ';
    hspice = '/usr/class/ee/synopsys/hspice/I-2013.12-SP2/hspice/ ';
end

spicefile = 'matlab.sp';

delete('matlab.ac0');
cmd = [lic hspice spicefile];


system(cmd);

end