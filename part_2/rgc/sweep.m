clear all
close all

load 180nch.mat;
pch = 0;

gm_id_rgc = linspace(5, 18, 7);
gm_rgc = linspace(1e-3, 20e-3, 7);
a = 5;

nel = length(gm_id_rgc) * length(gm_rgc) * length(a);

[gm_id_rgc_g, gm_rgc_g, a_g] = ndgrid(gm_id_rgc, gm_rgc, a);

gm_id_rgc_i = reshape(gm_id_rgc_g, [nel, 1]);
gm_rgc_i = reshape(gm_rgc_g, [nel, 1]);
a_i = reshape(a_g, [nel, 1]);

designs = cell(nel,1);

for i = 1:nel;
    d = struct();
    c = initialize_constraints();
    
    c.gm_id.m1 = gm_id_rgc_i(i);
    c.gm_id.m2 = gm_id_rgc_i(i);
    
    c.gm.m1 = gm_rgc_i(i);
    c.gm.m2 = gm_rgc_i(i);   
    
    c.rgc.a = a_i(i);
    
    d.r_1 = 900;

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

