%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the actual angular velocity against the
% desired, commanded and reference model angular velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularVelocityCommandReferenceState(log, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_x,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_x,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_c_x,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_x_ref,'b:', 'LineWidth',2)
hold off
l= legend('$$\omega_{x}(t)$$','$$\omega_{d,x}(t)$$','$$\omega_{c,x}(t)$$','$$\omega_{{\rm ref},x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_y,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_y,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_c_y,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_y_ref,'b:', 'LineWidth',2)
hold off
l= legend('$$\omega_{y}(t)$$','$$\omega_{d,y}(t)$$','$$\omega_{c,y}(t)$$','$$\omega_{{\rm ref},y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_z,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_d_z,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_c_z,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_z_ref,'b:', 'LineWidth',2)
hold off
l= legend('$$\omega_{z}(t)$$','$$\omega_{d,z}(t)$$','$$\omega_{c,z}(t)$$','$$\omega_{{\rm ref},z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
