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
plot(log.Controller_Time_s, log.Velocity_x_ms, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vx, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vx, 'r-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{x}(t)$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, log.Velocity_y_ms, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vy, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vy, 'r-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{y}(t)$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, log.Velocity_z_ms, 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, log.observer.mrao.x_hat.vz, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, log.observer.mrao2l.x_hat.vz, 'r-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{z}(t)$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

