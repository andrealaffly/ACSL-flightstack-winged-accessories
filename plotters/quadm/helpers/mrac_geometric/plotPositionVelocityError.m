%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the translational error in position and
% velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotPositionVelocityError(log,title)

set(figure, 'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s, log.e_x, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.e_y, 'LineWidth', 2)
plot(log.Controller_Time_s, log.e_z, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm x}(t)$$','$$e_{\rm y}(t)$$','$$e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s, log.e_vx, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.e_vy, 'LineWidth', 2)
plot(log.Controller_Time_s, log.e_vz, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm vx}(t)$$','$$e_{\rm vy}(t)$$','$$e_{\rm vz}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.e_x_int, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_y_int, 'LineWidth',2)
plot(log.Controller_Time_s,log.e_z_int, 'LineWidth',2)
hold off
l= legend('$$\int e_{\rm x}(t)$$','$$\int e_{\rm y}(t)$$', ...
          '$$\int e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end


