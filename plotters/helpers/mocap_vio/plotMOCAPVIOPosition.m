%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the vio, mocap states and the fcu state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotMOCAPVIOPosition(log,mocap,vio,title)


set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Position_x_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.x,'r--', 'LineWidth',2)
plot(vio.controller_time_s,vio.x,'b-.', 'LineWidth',2)
hold off
l= legend('$$x(t)$$','$$x_{\rm mocap}(t)$$', '$$x_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Position_y_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.y,'r--', 'LineWidth',2)
plot(vio.controller_time_s,vio.y,'b-.','LineWidth',2)
hold off
l= legend('$$y(t)$$','$$y_{\rm mocap}(t)$$', '$$y_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Position_z_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.z,'r--', 'LineWidth',2)
plot(vio.controller_time_s,vio.z,'b-.', 'LineWidth',2)
hold off
l= legend('$$z(t)$$','$$z_{\rm mocap}(t)$$','$$z_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor
ax = gca;
ax.YDir = 'reverse';
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

