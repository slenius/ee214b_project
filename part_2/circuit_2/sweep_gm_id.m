clear all
close all

load 180nch.mat;
pch = 0;

gm_id_m2 = linspace(3, 18, 7);
r1_r2 = logspace(-.7,.7, 7);
t = 3:10;

nel = length(gm_id_m2) * length(r1_r2) * length(t);

[gm_id_m2_g, r1_r2_g, t_g] = ndgrid(gm_id_m2, r1_r2, t);

gm_id_m2_i = reshape(gm_id_m2_g, [nel, 1]);
r1_r2_i = reshape(r1_r2_g, [nel, 1]);
t_i = reshape(t_g, [nel, 1]);

designs = cell(nel,1);

for i = 1:nel;
    design = struct();
    constraints = initialize_constraints();
    constraints.gm_id(2) = gm_id_m2_i(i);
    constraints.r1_r2_ratio = r1_r2_i(i);
    constraints.loop_gain = t_i(i);
    design = initialize_trans(design, constraints);

    for loop = 1:3
        fprintf('Loop %d...\n', loop);
        design = run_design_loop(design, constraints, nch, pch);
    end

    design = check_node_voltages(design, constraints);
    design = check_saturation(design, constraints);
    write_spice_file(design, constraints);
    run_spice();
    design = get_spice(design, constraints);
    
    designs{i} = design;

    fprintf('loop: %d\t', i);
    fprintf('t_0: %0.1f\t', design.t_0);
    fprintf('gm/id m2: %0.1f\t', design.m2.gm_id);
    fprintf('r1_r2: %0.2f\t', design.r_1 / design.r_2);
    fprintf('f: %0.2f\t', design.spice_f_cl/1e9);
    fprintf('a: %0.1f\n', design.spice_a_cl);
    close all
end

save('gm_id_sweep.mat');

