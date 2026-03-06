%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated velocity and the measured
% velocity of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstimatedVel(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, log.Velocity_x_ms, 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vx, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vx, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.vx, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.vx,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('vx [m/s]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, log.Velocity_y_ms, 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vy, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vy, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.vy, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.vy,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('vy [m/s]','interpreter','latex','fontsize',60)
axis tight
% grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, log.Velocity_z_ms, 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vz, 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vz, 'r-', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.vz, 'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.vz,'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l= legend('CHRONO', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
% set(l,'interpreter','latex','fontsize',15);
ylabel('vz [m/s]','interpreter','latex','fontsize',60)
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

