clear all
close all

load('sweep_gmid3_gmidbias_2.mat');

for i = 1:nel
    d = designs{i};
    
    gmid3(i) = d.m3.gm_id;
    gmidbias(i) = d.mb1.gm_id;
    
    if ~isempty(d.spice_f_cl)
        f(i) = d.spice_f_cl;
    else
        f(i) = 0;
    end
    a(i) = d.spice_a_cl;
end



f(a < 50) = 0;
a(a < 0) = 0;

rgc_a = 1;
rgc_a_i = sort(unique(rgc_a));

for i = 1:length(rgc_a_i)
    %f = f(rgc_a == rgc_a_i(i));
    %a = a(rgc_a == rgc_a_i(i));
    %gm1 = gm1(rgc_a==rgc_a_i(i));
    %gm2 = gm2(rgc_a==rgc_a_i(i));

    maxf(i) = max(f);

    xlin = linspace(min(gmid3),max(gmid3),33);
    ylin = linspace(min(gmidbias),max(gmidbias),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gmid3',gmidbias',f'/1e9);
    Z = tsi(X,Y);
    h = figure();
    set(h, 'Position', [100, 100, 800 600]);
    subplot(2,1,1);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id_3');
    ylabel('gm/id bias');
    caxis([0 6]);
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm/id_3 vs gm/id bias, gm1 = %0.1fmS, gm2 = %0.1fmS', d.m1.gm*1e3, d.m2.gm*1e3);
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gmid3',gmidbias',a');
    Z = tsi(X,Y);
    subplot(2,1,2);
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    caxis([0 57]);
    xlabel('gm/id_3');
    ylabel('gm/id bias');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    title(str);
    
end
% 
% figure;
% plot(t_i, maxf, '-*')
% xlabel('T0');
% ylabel('Max Speed');