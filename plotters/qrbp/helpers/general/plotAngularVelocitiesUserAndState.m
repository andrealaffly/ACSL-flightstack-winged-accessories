%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired angular velocities and state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularVelocitiesUserAndState(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_x_rads,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Desired_omega_x_rads,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm x}(t)$$','$$\omega_{\rm x, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_y_rads,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Desired_omega_y_rads,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm y}(t)$$', '$$\omega_{\rm y, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_z_rads,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Desired_omega_z_rads,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm z}(t)$$','$$\omega_{\rm z, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

