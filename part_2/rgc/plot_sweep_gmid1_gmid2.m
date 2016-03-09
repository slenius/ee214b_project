clear all
close all

load('sweep_gmid1_gmid2_2.mat');

for i = 1:nel
    d = designs{i};
    
    gmid1(i) = d.m1.gm_id;
    gmid2(i) = d.m2.gm_id;
    
    if ~isempty(d.spice_f_cl)
        f(i) = d.spice_f_cl;
    else
        f(i) = 0;
    end
    a(i) = d.spice_a_cl;
end



f(a < 55) = 0;
a(a < 0) = 0;

rgc_a = 1;
rgc_a_i = sort(unique(rgc_a));

for i = 1:length(rgc_a_i)
    %f = f(rgc_a == rgc_a_i(i));
    %a = a(rgc_a == rgc_a_i(i));
    %gm1 = gm1(rgc_a==rgc_a_i(i));
    %gm2 = gm2(rgc_a==rgc_a_i(i));

    maxf(i) = max(f);

    xlin = linspace(min(gmid1),max(gmid1),33);
    ylin = linspace(min(gmid2),max(gmid2),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gmid1',gmid2',f'/1e9);
    Z = tsi(X,Y);
    h = figure();
    set(h, 'Position', [100, 100, 800 600]);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id_1');
    ylabel('gm/id_2');
    caxis([0 max(f)/1e9]);
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm/id_1 vs gm/id_2, gm1 = %0.1fmS, gm2 = %0.1fmS', d.m1.gm*1e3, d.m2.gm*1e3);
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gmid1',gmid2',a');
    Z = tsi(X,Y);
    h = figure();
    set(h, 'Position', [100, 100, 800 600]);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id_1');
    ylabel('gm/id_2');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    title(str);
    
end
% 
% figure;
% plot(t_i, maxf, '-*')
% xlabel('T0');
% ylabel('Max Speed');