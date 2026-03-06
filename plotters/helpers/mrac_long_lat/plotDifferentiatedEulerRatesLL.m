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

function [] = plotDifferentiatedEulerRatesLL(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(log.rate_roll_real_rad_s), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(der.Angle_roll_dot_rad_s_matlab), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.phi_dot), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'MATLAB', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\phi}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(log.rate_pitch_real_rad_s), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(der.Angle_pitch_dot_rad_s_matlab), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.theta_dot), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'MATLAB', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\theta}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(log.rate_yaw_real_rad_s), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, rad2deg(der.Angle_yaw_dot_rad_s_matlab), 'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.psi_dot), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'MATLAB', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\psi}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',30);

end

