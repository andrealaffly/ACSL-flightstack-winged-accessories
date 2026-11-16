%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the actual Euler angles against the
% reference model Euler angles (derived from R_ref)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAttitudeTrajEuler(log, der, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(der.euler.roll),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.roll_ref),'r-.', 'LineWidth',2)
hold off
l= legend('$$\phi(t)$$','$$\phi_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(der.euler.pitch),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.pitch_ref),'r-.', 'LineWidth',2)
hold off
l= legend('$$\theta(t)$$','$$\theta_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(der.euler.yaw),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.yaw_ref),'r-.', 'LineWidth',2)
hold off
l= legend('$$\psi(t)$$','$$\psi_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
