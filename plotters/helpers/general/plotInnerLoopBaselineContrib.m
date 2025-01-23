%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the contributions of the components of the
% PID baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotInnerLoopBaselineContrib(log,der,title)

set(figure,'Color','White')

subplot(3,1,1)
plot(log.Controller_Time_s,der.Kp_rot_contrib(1,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(1,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\phi}(t)$$ contrib','$$K_{d,\phi}(t)$$ contrib','$$K_{i,\phi}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,der.Kp_rot_contrib(2,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(2,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\theta}(t)$$ contrib','$$K_{d,\theta}(t)$$ contrib','$$K_{i,\theta}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.Kp_rot_contrib(3,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(3,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\psi}(t)$$ contrib','$$K_{d,\psi}(t)$$ contrib','$$K_{i,\psi}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);


end

