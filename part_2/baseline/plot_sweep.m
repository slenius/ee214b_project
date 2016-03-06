clear all
close all

load('sweep.mat');

for i = 1:nel
    d = designs{i};
    
    gm_id(i) = d.m1.gm_id;
    av3(i) = d.a_v_3;
    f(i) = d.spice_f_cl;
    a(i) = d.spice_a_cl;
    t(i) = d.t_0;
end

f(a < 56) = 0;

t_i = sort(unique(t));

for i = 1:length(t_i)
    f_i = f(t == t_i(i));
    a_i = a(t == t_i(i));
    gm_id_i = gm_id(t==t_i(i));
    av3_i = av3(t==t_i(i));

    maxf(i) = max(f_i);

    xlin = linspace(min(gm_id_i),max(gm_id_i),33);
    ylin = linspace(min(av3_i),max(av3_i),33);
    [X,Y] = meshgrid(xlin,ylin);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_i',av3_i',f_i'/1e9);
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id');
    ylabel('av3');
    caxis([0 5]);
    h = colorbar;
    ylabel(h, 'Closed Loop Speed (GHz)');
    str = sprintf('gm/id vs av3, T = %0.1f', t_i(i));
    title(str);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tsi = TriScatteredInterp(gm_id_i',av3_i',a_i');
    Z = tsi(X,Y);
    figure;
    [C, h] = contourf(X, Y, Z);
    clabel(C, h);
    colormap(hot)
    xlabel('gm/id');
    ylabel('av3');
    h = colorbar;
    ylabel(h, 'Closed Loop Gain (dB)');
    str = sprintf('gm/id vs av3, T = %0.1f', t_i(i));
    title(str);
    
end

figure;
plot(t_i, maxf, '-*')
xlabel('T0');
ylabel('Max Speed');