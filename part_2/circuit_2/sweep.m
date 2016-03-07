clear all
close all

load 180nch.mat;
pch = 0;

id_2 = linspace(100e-6, 2000e-6, 20);
r1_r2_ratio = 2;
t = 4;

nel = length(id_2) * length(r1_r2_ratio) * length(t);

[id_2_g, r1_r2_ratio_g, t_g] = ndgrid(id_2, r1_r2_ratio, t);

id_2_i = reshape(id_2_g, [nel, 1]);
r1_r2_ratio_i = reshape(r1_r2_ratio_g, [nel, 1]);
t_i = reshape(t_g, [nel, 1]);

designs = cell(nel,1);

for i = 1:nel;
    design = struct();
    constraints = initialize_constraints();
    
    constraints.stage_id(2) = id_2_i(i);
    
    constraints.r1_r2_ratio = r1_r2_ratio_i(i);
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
    fprintf('id: %0.1fu\t', design.m3.id*1e6);
    fprintf('a_v_3: %0.2f\t', design.a_v_3);
    fprintf('f: %0.2f\t', design.spice_f_cl/1e9);
    fprintf('a: %0.1f\n', design.spice_a_cl);
    close all
end

clear nch
save('sweep.mat');

