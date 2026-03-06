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

function [] = plotEstimatedEulerAnglesLL(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(log.Angle_roll_rad), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat.phi), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\phi$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(log.Angle_pitch_rad), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat.theta), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\theta$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(wrapToPi(log.Angle_yaw_rad)), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(wrapToPi(log.differentiator.mrad_2l.x_hat.psi)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\psi$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',30);

end

