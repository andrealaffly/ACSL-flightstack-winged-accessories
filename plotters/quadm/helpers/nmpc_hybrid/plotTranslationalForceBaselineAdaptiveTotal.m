%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the baseline (outer NMPC), adaptive (MRAC)
% and total translational force, one subplot per axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalForceBaselineAdaptiveTotal(log, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.mu_x_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_x_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_x_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\mu_{x,{\rm baseline}}(t)$$','$$\mu_{x,{\rm adaptive}}(t)$$','$$\mu_{x,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.mu_y_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_y_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\mu_{y,{\rm baseline}}(t)$$','$$\mu_{y,{\rm adaptive}}(t)$$','$$\mu_{y,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.mu_z_baseline,'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_z_adaptive,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_z_total,'k-', 'LineWidth',2)
hold off
l= legend('$$\mu_{z,{\rm baseline}}(t)$$','$$\mu_{z,{\rm adaptive}}(t)$$','$$\mu_{z,{\rm total}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
