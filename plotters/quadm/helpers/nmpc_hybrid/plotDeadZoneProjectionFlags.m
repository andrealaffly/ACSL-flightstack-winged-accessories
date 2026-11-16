%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the dead-zone values and the projection
% operator activation flags for both the translational and rotational MRAC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDeadZoneProjectionFlags(log, title)

set(figure,'Color','White')

subplot(3,1,1)
plot(log.Controller_Time_s,log.dead_zone_value_tran,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.dead_zone_value_rot,'b-', 'LineWidth',2)
hold off
l= legend('${\rm dead \, zone, \, tran}(t)$$','${\rm dead \, zone, \, rot}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
stairs(log.Controller_Time_s,log.proj_activated_K_hat_x_tran,'r-', 'LineWidth',2)
hold on
stairs(log.Controller_Time_s,log.proj_activated_K_hat_r_tran,'g-', 'LineWidth',2)
stairs(log.Controller_Time_s,log.proj_activated_Theta_hat_tran,'b-', 'LineWidth',2)
hold off
l= legend('$$\hat{K}_{x,{\rm tran}}(t)$$','$$\hat{K}_{r,{\rm tran}}(t)$$','$$\hat{\Theta}_{\rm tran}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
stairs(log.Controller_Time_s,log.proj_activated_K_hat_x_rot,'r-', 'LineWidth',2)
hold on
stairs(log.Controller_Time_s,log.proj_activated_K_hat_r_rot,'g-', 'LineWidth',2)
stairs(log.Controller_Time_s,log.proj_activated_Theta_hat_rot,'b-', 'LineWidth',2)
hold off
l= legend('$$\hat{K}_{x,{\rm rot}}(t)$$','$$\hat{K}_{r,{\rm rot}}(t)$$','$$\hat{\Theta}_{\rm rot}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
