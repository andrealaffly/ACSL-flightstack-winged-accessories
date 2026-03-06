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

function [] = plotDiffErrEulerRatesLL(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.real.phi_dot)), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.diff.phi_dot)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\phi}}\|$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.real.theta_dot)), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.diff.theta_dot)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\theta}}\|$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.real.psi_dot)), 'k:', 'LineWidth', 3)
plot(log.Controller_Time_s, abs(rad2deg(der.abs_err.angular_rate.diff.psi_dot)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('CHRONO', 'DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\psi}}\|$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',30);

end

