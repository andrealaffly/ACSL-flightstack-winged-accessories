%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the vio state and the fcu state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [] = plotVIOEulerAngles(log,vio,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,rad2deg(vio.roll),'b-.', 'LineWidth',2)
hold off
l= legend('$$\phi(t)$$','$$\phi_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,rad2deg(vio.pitch),'b-.', 'LineWidth',2)
hold off
l= legend('$$\theta(t)$$','$$\theta_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,rad2deg(vio.yaw),'b-.', 'LineWidth',2)
hold off
l= legend('$$\psi(t)$$','$$\psi_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
ax = gca;
ax.YDir = 'reverse';
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

