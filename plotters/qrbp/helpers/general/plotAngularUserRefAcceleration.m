%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user angular acceleration and 
% the reference model angular acceleration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/28/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularUserRefAcceleration(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_alpha_x_rads2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_ref_x,'b--','LineWidth',2)
hold off
l= legend('$$\dot{\omega}_{\rm x,user}(t)$$','$$\dot{\omega}_{\rm x,ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_alpha_y_rads2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_ref_y,'b--','LineWidth',2)
hold off
l= legend('$$\dot{\omega}_{\rm y,user}(t)$$','$$\dot{\omega}_{\rm y,ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_alpha_z_rads2,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_ref_z,'b--','LineWidth',2)
hold on
l= legend('$$\dot{\omega}_{\rm z,user}(t)$$','$$\dot{\omega}_{\rm z,ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

