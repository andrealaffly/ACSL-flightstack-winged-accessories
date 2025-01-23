%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the vio state and the fcu state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotVIOAngularVelocity(log,vio,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_x_rads,'k-', 'LineWidth',2)
hold on
plot(vio.controller_time_s,vio.rollspeed,'b-.','LineWidth',2)
hold off
l= legend('$$\omega_x(t)$$','$$\omega_{x_{\rm vio}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_y_rads,'k-', 'LineWidth',2)
hold on
plot(vio.controller_time_s,vio.pitchspeed,'b-.','LineWidth',2)
hold off
l= legend('$$\omega_y(t)$$','$$\omega_{y_{\rm vio}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_z_rads,'k-', 'LineWidth',2)
hold on
plot(vio.controller_time_s,vio.yawspeed,'b-.','LineWidth',2)
hold off
l= legend('$$\omega_z(t)$$','$$\omega_{z_{\rm vio}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rads/s]','interpreter','latex','fontsize',20)
axis tight
grid minor  
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

