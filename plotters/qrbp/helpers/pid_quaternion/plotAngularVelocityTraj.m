%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired angular velocities and state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularVelocityTraj(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_x,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_x,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm x}(t)$$','$$\omega_{\rm x, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_y,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_y,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm y}(t)$$', '$$\omega_{\rm y, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_z,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_z,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{\rm z}(t)$$','$$\omega_{\rm z, desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

