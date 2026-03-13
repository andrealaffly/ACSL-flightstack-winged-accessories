%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired angle and the state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAttitudeTrajEuler(log,der,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(der.euler.roll),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.roll_d),'r-.', 'LineWidth',2)
hold off
l= legend('$$\phi(t)$$','$$\phi_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(der.euler.pitch),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.pitch_d),'r-.', 'LineWidth',2)
hold off
l= legend('$$\theta(t)$$','$$\theta_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(der.euler.yaw),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(der.euler.yaw_d),'r-.', 'LineWidth',2)
hold off
l= legend('$$\psi(t)$$','$$\psi_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

