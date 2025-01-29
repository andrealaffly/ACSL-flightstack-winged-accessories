%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the baseline and the adaptive contributions
% for the virtual control input in the inertial frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/28/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalBaselineAdaptiveU(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.mu_tran_baseline_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_tran_baseline_y, 'LineWidth',2)  
plot(log.Controller_Time_s,log.mu_tran_baseline_z, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z,baseline}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.mu_tran_adaptive_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_tran_adaptive_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_tran_adaptive_z, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x,adaptive}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y,adaptive}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z,adaptive}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

