clear all
close all

load('sweep_gm1_gm2.mat');

for i = 1:nel
    d = designs{i};
    
    gm1(i) = d.m1.gm;
    gm2(i) = d.m2.gm;
    
    if length(d.spice_f_cl)
        f(i) = d.spice_f_cl;
    else
        f(i) = 0;
    end
    a(i) = d.spice_a_cl;
end



%f(a < 55) = 0;
a(a < 0) = 0;

rgc_a = 1;
rgc_a_i = sort(unique(rgc_a));

for i = 1:length(rgc_a_i)
    %f = f(rgc_a == rgc_a_i(i));
    %a = a(rgc_a == rgc_a_i(i));
    %gm1 = gm1(rgc_a==rgc_a_i(i));
    %gm2 = gm2(rgc_a==rgc_a_i(i));

    maxf(i) = max(f);

    xlin = linspace(min(gm1),max(gm1),33);
    ylin = linspace(min(gm2),max(gm2),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm1',gm2',f'/1e9);
    Z = tsi(X,Y);
    h = figure();
    set(h, 'Position', [100, 100, 800 600]);
    subplot(2,1,1);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm_1');
    ylabel('gm_2');
    caxis([0 6]);
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm_1 vs gm_2, gm/id_1 = %0.1f gm/id_2 = %0.1f', d.m1.gm_id, d.m2.gm_id);
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm1',gm2',a');
    Z = tsi(X,Y);
    subplot(2,1,2);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    caxis([0 57]);
    xlabel('gm_1');
    ylabel('gm_2');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    title(str);
    
end
% 
% figure;
% plot(t_i, maxf, '-*')
% xlabel('T0');
% ylabel('Max Speed');