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

function [] = plotEstimatedPos(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, log.Position_x_m, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.x, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.x, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.x, 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.x, 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.x, 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', '$$x_0 + \int_{0}^{t} \dot{x} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('x [m]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, log.Position_y_m, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.y, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.y, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.y, 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.y, 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.y, 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', '$$y_0 + \int_{0}^{t} \dot{y} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('y [m]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, log.Position_z_m, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, der.observer.integrated_pos_from_vel.z, 'm--', 'LineWidth', 2.5)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.z, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.z, 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mraovs.x_hat.z, 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2lvs.x_hat.z, 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', '$$z_0 + \int_{0}^{t} \dot{z} (\tau) d\tau$$', 'MRA0', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('z [m]','interpreter','latex','fontsize',30)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

