%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated euler rates and the actual
% euler rates of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDifferentiatedEulerRates(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(log.inner_loop.phi_dot), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.phi_dot), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.phi_dot), 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.phi_dot), 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.phi_dot),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\phi}$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(log.inner_loop.theta_dot), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.theta_dot), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.theta_dot), 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.theta_dot), 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.theta_dot),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\theta}$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(log.inner_loop.psi_dot), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.psi_dot), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.psi_dot), 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.psi_dot), 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.psi_dot),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\psi}$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight
xlabel('t [s]','interpreter','latex','fontsize',60)
% sgtitle(title,'Interpreter','latex','FontSize',20);

% -------- Single horizontal legend at the top (using lines from subplot 1) --------
ax3 = subplot(3,1,3);
h  = get(ax3,'Children');   % handles in reverse plotting order: last plotted is h(1)
% Reorder to: CHRONO, integral, MRAO, 2L MRAO, MRAO VS, 2L MRAO VS
h_chrono    = h(5);
h_mrao   = h(4);
h_2l     = h(3);
h_vs     = h(2);
h_2lvs   = h(1);
leg = legend([h_chrono h_mrao h_2l h_vs h_2lvs], ...
    'CHRONO', ...
    'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS', ...
    'Orientation','horizontal', 'Interpreter','latex', 'FontSize',40);
set(leg,'Location','southoutside');

end

