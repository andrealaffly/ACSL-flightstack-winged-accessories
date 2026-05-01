%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the translational error in position,
% velocity and the integral error in the position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranErrors(log,title)

set(figure, 'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s, log.e_x, 'r-', 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.e_y, 'g-', 'LineWidth', 2)
plot(log.Controller_Time_s, log.e_z, 'b-', 'LineWidth', 2)
hold off
l= legend('$$e_{\rm x}(t)$$','$$e_{\rm y}(t)$$','$$e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s, log.e_vx, 'r-', 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.e_vy, 'g-', 'LineWidth', 2)
plot(log.Controller_Time_s, log.e_vz, 'b-', 'LineWidth', 2)
hold off
l= legend('$$e_{\rm vx}(t)$$','$$e_{\rm vy}(t)$$','$$e_{\rm vz}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor


subplot(3,1,3)
plot(log.Controller_Time_s, log.e_x_int, 'r-', 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.e_y_int, 'g-', 'LineWidth', 2)
plot(log.Controller_Time_s, log.e_z_int, 'b-', 'LineWidth', 2)
hold off
l= legend('$$\int_0^t e_{\rm x}(\tau) d\tau$$', ...
          '$$\int_0^t e_{\rm y}(\tau) d\tau$$', ...
          '$$\int_0^t e_{\rm z}(\tau) d\tau$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

