%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the baseline and the adaptive contributions
% for the Moment setpoints in the inner loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/28/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotRotationalBaselineAdaptiveU(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.Tau_baseline_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Tau_baseline_y, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Tau_baseline_z, 'LineWidth',2)
hold off
l= legend('$$\tau_{\rm x,baseline}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm y,baseline}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm z,baseline}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Tau_adaptive_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Tau_adaptive_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.Tau_adaptive_z, 'LineWidth',2)
hold off
l= legend('$$\tau_{\rm x,adaptive}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm y,adaptive}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm z,adaptive}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

