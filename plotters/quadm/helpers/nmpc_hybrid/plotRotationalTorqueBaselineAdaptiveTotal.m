%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the baseline (inner NMPC), adaptive (MRAC)
% and total rotational torque, one subplot per axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotRotationalTorqueBaselineAdaptiveTotal(log, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.tau_x_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.tau_x_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.tau_x_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\tau_{x,{\rm baseline}}(t)$$','$$\tau_{x,{\rm adaptive}}(t)$$','$$\tau_{x,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.tau_y_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.tau_y_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.tau_y_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\tau_{y,{\rm baseline}}(t)$$','$$\tau_{y,{\rm adaptive}}(t)$$','$$\tau_{y,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.tau_z_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.tau_z_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.tau_z_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\tau_{z,{\rm baseline}}(t)$$','$$\tau_{z,{\rm adaptive}}(t)$$','$$\tau_{z,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N m]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
