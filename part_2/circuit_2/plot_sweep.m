clear all
close all

load('sweep.mat');

for i = 1:nel
    d = designs{i};
    
    id(i) = d.m3.id;
    r1_r2(i) = d.r_1 / d.r_2;
    f(i) = d.spice_f_cl;
    a(i) = d.spice_a_cl;
    t(i) = d.t_0;
    f_w(i) = d.t_w.f;
    gm(i) = d.m3.gm;
end



% f(a < 56) = 0;
% 
% t_i = sort(unique(t));
% 
% for i = 1:length(t_i)
%     f_i = f(t == t_i(i));
%     a_i = a(t == t_i(i));
%     gm_id_i = id(t==t_i(i));
%     r1_r2_i = r1_r2(t==t_i(i));
% 
%     maxf(i) = max(f_i);
% 
%     xlin = linspace(min(gm_id_i),max(gm_id_i),33);
%     ylin = linspace(min(r1_r2_i),max(r1_r2_i),33);
%     [X,Y] = meshgrid(xlin,ylin);
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     tsi = TriScatteredInterp(gm_id_i',r1_r2_i',f_i'/1e9);
%     Z = tsi(X,Y);
%     figure;
%     [C, h] = contourf(X, Y, Z);
%     clabel(C, h);
%     colormap(hot)
%     xlabel('gm/id');
%     ylabel('av3');
%     caxis([0 5]);
%     h = colorbar;
%     ylabel(h, 'Closed Loop Speed (GHz)');
%     str = sprintf('gm/id vs av3, T = %0.1f', t_i(i));
%     title(str);
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     tsi = TriScatteredInterp(gm_id_i',r1_r2_i',a_i');
%     Z = tsi(X,Y);
%     figure;
%     [C, h] = contourf(X, Y, Z);
%     clabel(C, h);
%     colormap(hot)
%     xlabel('gm/id');
%     ylabel('av3');
%     h = colorbar;
%     ylabel(h, 'Closed Loop Gain (dB)');
%     str = sprintf('gm/id vs av3, T = %0.1f', t_i(i));
%     title(str);
%     
% end
% 
% figure;
% plot(t_i, maxf, '-*')
% xlabel('T0');
% ylabel('Max Speed');