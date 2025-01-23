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

function [] = plotOuterLoopBaselineContrib(log,der,title)

set(figure,'Color','White')

subplot(3,1,1)
plot(log.Controller_Time_s,der.Kp_tran_contrib(1,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(1,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,x}(t)$$ contrib','$$K_{d,x}(t)$$ contrib','$$K_{i,x}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,der.Kp_tran_contrib(2,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(2,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,y}(t)$$ contrib','$$K_{d,y}(t)$$ contrib','$$K_{i,y}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.Kp_tran_contrib(3,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(3,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,z}(t)$$ contrib','$$K_{d,z}(t)$$ contrib','$$K_{i,z}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

