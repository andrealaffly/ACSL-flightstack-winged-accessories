%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the vio state and the fcu state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotVIOVelocity(log,vio,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Velocity_x_ms,'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,vio.vx,'b-.','LineWidth',2)
hold off
l= legend('$$\dot{x}(t)$$', '$$\dot{x}_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Velocity_y_ms,'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,vio.vy,'b-.','LineWidth',2)
hold off
l= legend('$$\dot{y}(t)$$', '$$\dot{y}_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Velocity_z_ms,'k-','LineWidth',2)
hold on
plot(vio.controller_time_s,vio.vz,'b-.','LineWidth',2)
hold off
l= legend('$$\dot{z}(t)$$', '$$\dot{z}_{\rm vio}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
ax = gca;
ax.YDir = 'reverse';
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

