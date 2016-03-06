clear all
close all

load 180nch.mat;
pch = 0;

gm_id = linspace(3, 18, 7);
av3 = linspace(1, 5, 7);
t = 2:1:10;

nel = length(gm_id) * length(av3) * length(t);

[gm_id_g, av3_g, t_g] = ndgrid(gm_id, av3, t);

gm_id_i = reshape(gm_id_g, [nel, 1]);
av3_i = reshape(av3_g, [nel, 1]);
t_i = reshape(t_g, [nel, 1]);

designs = cell(nel,1);

for i = 1:nel;
    design = struct();
    constraints = initialize_constraints();
    constraints.gm_id(1) = gm_id_i(i);
    constraints.gm_id(2) = gm_id_i(i);
    constraints.a_v_3 = av3_i(i);
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
    fprintf('gm/id: %0.1f\t', design.m1.gm_id);
    fprintf('gm/id: %0.1f\t', design.m2.gm_id);
    fprintf('gm/id: %0.1f\t', design.m3.gm_id);
    fprintf('a_v_3: %0.2f\t', design.a_v_3);
    fprintf('f: %0.2f\t', design.spice_f_cl/1e9);
    fprintf('a: %0.1f\n', design.spice_a_cl);
    close all
end

delete(nch);
save('sweep.mat');

