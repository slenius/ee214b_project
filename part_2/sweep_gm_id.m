clear all
close all

load 180nch.mat;
pch = 0;

gm_id_x = 8:0.5:20;

for i = 1:length(gm_id_x);
    design = struct();
    constraints = initialize_constraints();
    constraints.gm_id(2) = gm_id_x(i);
    design = initialize_trans(design, constraints);

    for loop = 1:5
        fprintf('Loop %d...\n', loop);
        design = run_design_loop(design, constraints, nch, pch);
    end

    design = check_saturation(design, constraints);
    write_spice_file(design, constraints);
    run_spice();
    design = get_spice_3db(design, constraints);
    
    f(i) = design.f_3db_spice;
    
end

figure;
plot(gm_id_x, f);
xlabel('gm_id');
ylabel('f');
