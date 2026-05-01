%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user acceleration and the 
% reference model acceleration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotUserRefAcceleration(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.User_Acceleration_x_ms2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Acceleration_x_ms2,'b--','LineWidth',2)
hold off
l= legend('$$\ddot{x}_{\rm user}(t)$$','$$\ddot{x}_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.User_Acceleration_y_ms2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Acceleration_y_ms2,'b--','LineWidth',2)
hold off
l= legend('$$\ddot{y}_{\rm user}(t)$$','$$\ddot{y}_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.User_Acceleration_z_ms2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Acceleration_z_ms2,'b--','LineWidth',2)
hold on
l= legend('$$\ddot{z}_{\rm user}(t)$$','$$\ddot{z}_{\rm ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

