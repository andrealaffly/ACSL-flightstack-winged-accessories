%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user angular velocities,
% reference angular velocities and the actual angular velocities
% of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/28/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularVelocitiesUserRefState(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_wx_rads,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_x,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.omega_x_rads,'k-','LineWidth',2)
hold off
l= legend('$$\omega_{\rm x,cmd}(t)$$', '$$\omega_{\rm x,ref}(t)$$', '$$\omega_{\rm x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_wy_rads,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_y,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.omega_y_rads,'k-','LineWidth',2)
hold off
l= legend('$$\omega_{\rm y,cmd}(t)$$', '$$\omega_{\rm y,ref}(t)$$', '$$\omega_{\rm y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_wz_rads,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_z,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.omega_y_rads,'k-','LineWidth',2)
hold off
l= legend('$$\omega_{\rm z,cmd}(t)$$', '$$\omega_{\rm z,ref}(t)$$', '$$\omega_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);


end

