%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired angle and the state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEulerUserAndAngle(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Desired_phi_rad),'r-.', 'LineWidth',2)
hold off
l= legend('$$\phi(t)$$','$$\phi_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Desired_theta_rad),'r-.', 'LineWidth',2)
hold off
l= legend('$$\theta(t)$$','$$\theta_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Desired_psi_rad),'r-.', 'LineWidth',2)
hold off
l= legend('$$\psi(t)$$','$$\psi_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

