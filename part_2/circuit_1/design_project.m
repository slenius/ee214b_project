clear all
close all

%addpath('../matlab');
%addpath('/usr/class/ee214b/matlab');

load 180nch.mat;
load 180pch.mat;

design = struct();
constraints = initialize_constraints();
%constraints.gm_id(2) = 5;
design = initialize_trans(design, constraints);

for i = 1:5
    fprintf('Loop %d...\n', i);
    design = run_design_loop(design, constraints, nch, pch);
end

design = check_node_voltages(design, constraints);
design = check_saturation(design, constraints);

write_spice_file(design, constraints);

run_spice();

design = get_spice_3db(design, constraints);

d = design;
c = constraints;
