clear all
close all

load 180nch.mat;
load 180pch.mat;

sw_a = linspace(1, 18, 8);
sw_b = linspace(1, 18, 8);
%sw_a = linspace(1e-3, 10e-3, 7);
%sw_b = linspace(1e-3, 20e-3, 7);
sw_c = 0;

nel = length(sw_a) * length(sw_b) * length(sw_c);

[sw_a_g, sw_b_g, sw_c_g] = ndgrid(sw_a, sw_b, sw_c);

sw_a_i = reshape(sw_a_g, [nel, 1]);
sw_b_i = reshape(sw_b_g, [nel, 1]);
sw_c_i = reshape(sw_c_g, [nel, 1]);

designs = cell(nel,1);

for i = 1:nel;
    d = struct();
    c = initialize_constraints();
    
    %c.gm.m1 = sw_a_i(i);
    %c.gm.m2 = sw_b_i(i);
    %c.gm_id.m1 = sw_a_i(i);
    %c.gm_id.m2 = sw_b_i(i);
    c.gm_id.m3 = sw_a_i(i);
    c.gm_id.mbias = sw_b_i(i);
    
    d = initialize_trans(d, c);

    for loop = 1:3
        fprintf('Loop %d...\n', loop);
        d = run_design_loop(d, c, nch, pch);
    end

    d = check_node_voltages(d, c);
    d = check_saturation(d, c);
    write_rgc_file(d, c);
    run_spice();
    d = get_spice(d, c);
    
    designs{i} = d;

    fprintf('loop: %d\t', i);
    fprintf('gm_id m1: %0.1f\t', d.m1.gm_id);
    fprintf('gm m1: %0.1fmS\t', d.m1.gm*1e3);
    fprintf('id m1: %0.1fu\t', d.m1.id*1e6);
    fprintf('f: %0.2f\t', d.spice_f_cl/1e9);
    fprintf('a: %0.1f\n', d.spice_a_cl);
    close all
end

clear nch
clear pch
save('sweep.mat');

