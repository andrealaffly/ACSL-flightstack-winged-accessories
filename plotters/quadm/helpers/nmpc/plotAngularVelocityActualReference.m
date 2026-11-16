%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the actual angular velocity against the
% reference model angular velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularVelocityActualReference(log, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_x,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_x_ref,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{x}(t)$$','$$\omega_{x,{\rm ref}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_y,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_y_ref,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{y}(t)$$','$$\omega_{y,{\rm ref}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_z,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_z_ref,'r-.', 'LineWidth',2)
hold off
l= legend('$$\omega_{z}(t)$$','$$\omega_{z,{\rm ref}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
