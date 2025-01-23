%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user velocity and the actual
% velocity of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotVelUser(log, title)

set(figure,'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.User_Velocity_x_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_x_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{x}_{\rm cmd}(t)$$','$$\dot{x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.User_Velocity_y_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_y_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{y}_{\rm cmd}(t)$$','$$\dot{y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.User_Velocity_z_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_z_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{z}_{\rm cmd}(t)$$','$$\dot{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

