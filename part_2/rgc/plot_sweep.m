clear all
close all

load('sweep.mat');

for i = 1:nel
    d = designs{i};
    
    id(i) = d.m1.id;
    gm_id(i) = d.m1.gm_id;
    if length(d.spice_f_cl)
        f(i) = d.spice_f_cl;
    else
        f(i) = 0;
    end
    a(i) = d.spice_a_cl;
    rgc_a(i) = d.r_b * d.m2.gm;
    gm(i) = d.m1.gm;
end



f(a < 55) = 0;
a(a < 0) = 0;

rgc_a_i = sort(unique(rgc_a));

for i = 1:length(rgc_a_i)
    f_i = f(rgc_a == rgc_a_i(i));
    a_i = a(rgc_a == rgc_a_i(i));
    gm_id_i = gm_id(rgc_a==rgc_a_i(i));
    gm_i = gm(rgc_a==rgc_a_i(i));

    maxf(i) = max(f_i);

    xlin = linspace(min(gm_id_i),max(gm_id_i),33);
    ylin = linspace(min(gm_i),max(gm_i),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_i',gm_i',f_i'/1e9);
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id');
    ylabel('gm');
    caxis([0 5]);
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm/id vs gm, A = %0.1f', rgc_a_i(i));
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_i',gm_i',a_i');
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id');
    ylabel('gm');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    str = sprintf('gm/id vs gm, A = %0.1f', rgc_a_i(i));
    title(str);
    
end
% 
% figure;
% plot(t_i, maxf, '-*')
% xlabel('T0');
% ylabel('Max Speed');