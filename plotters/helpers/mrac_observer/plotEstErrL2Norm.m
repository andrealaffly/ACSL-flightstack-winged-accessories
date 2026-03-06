%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the L2 norm of the estimation errors w.r.t
% time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/60/6026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrL2Norm(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_combined, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_combined, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mraovs.L2_norm_combined, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2lvs.L2_norm_combined,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
% l= legend('MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm total}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',35)
axis tight
% grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_pos, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_pos, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mraovs.L2_norm_pos, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2lvs.L2_norm_pos,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
% l= legend('MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm pos}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',35)
axis tight
% grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_vel, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_vel, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mraovs.L2_norm_vel, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, der.observer.mrao2lvs.L2_norm_vel,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
% l= legend('MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm vel}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',35)
axis tight
% grid minor
xlabel('t [s]','interpreter','latex','fontsize',60)
% sgtitle(title,'Interpreter','latex','FontSize',60);

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

