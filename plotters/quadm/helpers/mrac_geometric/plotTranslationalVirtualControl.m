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

function [] = plotTranslationalVirtualControl(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.mu_x_baseline, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_baseline, 'LineWidth',2)  
plot(log.Controller_Time_s,log.mu_z_baseline, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z,baseline}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.mu_x_adaptive, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_adaptive, 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_z_adaptive, 'LineWidth',2)
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

