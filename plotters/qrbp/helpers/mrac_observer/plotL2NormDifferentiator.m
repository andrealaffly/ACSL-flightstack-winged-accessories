%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the L2 Norm of the errors of the 
% differentiator of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/40/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotL2NormDifferentiator(log,der,title)

set(figure,'Color','white')
subplot(3,1,1)
hold on
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad.total,      'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l.total,    'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_vs.total,    'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l_vs.total,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm total}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad.euler,      'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l.euler,    'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_vs.euler,    'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l_vs.euler,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm euler}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad.euler_dot,      'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l.euler_dot,    'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_vs.euler_dot,    'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l_vs.euler_dot,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm{euler\, \, rate}}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',60)
% sgtitle(title,'Interpreter','latex','FontSize',40);


% -------- Single horizontal legend at the top (using lines from subplot 1) --------
ax3 = subplot(3,1,3);
h  = get(ax3,'Children');   % handles in reverse plotting order: last plotted is h(1)
% Reorder to: CHRONO, integral, MRAO, 2L MRAO, MRAO VS, 2L MRAO VS
h_mrao   = h(4);
h_2l     = h(3);
h_vs     = h(2);
h_2lvs   = h(1);
leg = legend([h_mrao h_2l h_vs h_2lvs], ...
    'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS', ...
    'Orientation','horizontal', 'Interpreter','latex', 'FontSize',40);
set(leg,'Location','southoutside');

end