%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated euler angles and the actual
% euler angles of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstimatedEulerAngles(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(log.Angle_roll_rad), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat.phi), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat.phi), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat.phi), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat.phi), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\phi$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(log.Angle_pitch_rad), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat.theta), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat.theta), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat.theta), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat.theta), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\theta$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(unwrap(log.Angle_yaw_rad)), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat.psi), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat.psi), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat.psi), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat.psi), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\psi$$ [deg]','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t$$ [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

