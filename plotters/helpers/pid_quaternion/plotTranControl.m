%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the outerloop virtual controls in the
% inertial and the body frame w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranControl(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.mu_x_I, 'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_I, 'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.mu_z_I, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{I}}(t)$$','$$\mu_{\rm y}^{\mathbf{I}}(t)$$','$$\mu_{\rm z}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.mu_x_J, 'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_J, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_z_J, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{J}}(t)$$','$$\mu_{\rm y}^{\mathbf{J}}(t)$$','$$\mu_{\rm z}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

