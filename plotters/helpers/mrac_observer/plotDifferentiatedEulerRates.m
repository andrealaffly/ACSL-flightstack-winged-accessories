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
plot(log.Controller_Time_s, rad2deg(log.inner_loop.phi_dot), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.phi_dot), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.phi_dot), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.phi_dot), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.phi_dot), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\phi}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
% grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(log.inner_loop.theta_dot), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.theta_dot), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.theta_dot), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.theta_dot), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.theta_dot), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\theta}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
% grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(log.inner_loop.psi_dot), 'k:', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad.x_hat_dot.psi_dot), 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l.x_hat_dot.psi_dot), 'r-', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_vs.x_hat_dot.psi_dot), 'g-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(log.differentiator.mrad_2l_vs.x_hat_dot.psi_dot), 'c-', 'LineWidth', 1.5)
hold off
l= legend('PX4 EKF2', 'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\dot{\psi}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t$$ [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

