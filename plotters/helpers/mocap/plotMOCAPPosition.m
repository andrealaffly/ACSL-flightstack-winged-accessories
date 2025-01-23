%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the fcu position vs the mocap data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotMOCAPPosition(log,mocap,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Position_x_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.x,'r--', 'LineWidth',2)
hold off
l= legend('$$x(t)$$','$$x_{\rm mocap}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Position_y_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.y,'r--', 'LineWidth',2)
hold off
l= legend('$$y(t)$$','$$y_{\rm mocap}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Position_z_m,'k-','LineWidth',2)
hold on
plot(mocap.Mocap_time_s,mocap.z,'r--', 'LineWidth',2)
hold off
l= legend('$$z(t)$$','$$z_{\rm mocap}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor
ax = gca;
ax.YDir = 'reverse';
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

