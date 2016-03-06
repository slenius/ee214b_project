clear all
close all

load('gm_id_sweep.mat');

for i = 1:nel
    d = designs{i};
    
    gm_id_m2(i) = d.m2.gm_id;
    r1_r2(i) = d.r_1 / d.r_2;
    f(i) = d.spice_f_cl;
    a(i) = d.spice_a_cl;
    t(i) = d.t_0;
end

f(a < 50) = 0;

t_i = sort(unique(t));

for i = 1:length(t_i)
    f_i = f(t == t_i(i));
    a_i = a(t == t_i(i));
    gm_id_m2_i = gm_id_m2(t==t_i(i));
    r1_r2_i = r1_r2(t==t_i(i));

    maxf(i) = max(f_i);

    xlin = linspace(min(gm_id_m2_i),max(gm_id_m2_i),33);
    ylin = linspace(min(log(r1_r2_i)),max(log(r1_r2_i)),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_m2_i',log(r1_r2_i)',f_i'/1e9);
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id m2');
    ylabel('log(r1/r2)');
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm/id m2 vs r1/r2, T = %0.1f', t_i(i));
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_m2_i',log(r1_r2_i)',a_i');
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id m2');
    ylabel('log(r1/r2)');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    str = sprintf('gm/id m2 vs r1/r2, T = %0.1f', t_i(i));
    title(str);
    
end

figure;
plot(t_i, maxf, '-*')
xlabel('T0');
ylabel('Max Speed');