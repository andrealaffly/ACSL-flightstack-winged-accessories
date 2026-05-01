%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated position and the actual
% position of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstimatedPos(log, title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, log.Position_x_m, 'k:', 'LineWidth', 3)
% plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.x, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.x, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.x, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.x, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.x,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', '$$x_0 + \int_{0}^{t} \dot{x} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('x [m]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, log.Position_y_m, 'k:', 'LineWidth', 3)
% plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.y, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.y, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.y, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.y, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.y,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', '$$y_0 + \int_{0}^{t} \dot{y} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('y [m]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, log.Position_z_m, 'k:', 'LineWidth', 3)
% plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.z, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.z, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.z, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.z, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.z,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', '$$z_0 + \int_{0}^{t} \dot{z} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('z [m]','interpreter','latex','fontsize',60)
axis tight
ax = gca;
ax.YDir = 'reverse';
% grid minor
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

