%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the outerloop virtual controls in the
% inertial and the body frame w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotOuterLoopVirtualControls(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_x_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_y_N, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_z_N, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{I}}(t)$$','$$\mu_{\rm y}^{\mathbf{I}}(t)$$','$$\mu_{\rm z}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Virtual_control_in_body_x_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Virtual_control_in_body_y_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Virtual_control_in_body_z_N, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{J}}(t)$$','$$\mu_{\rm y}^{\mathbf{J}}(t)$$','$$\mu_{\rm z}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

