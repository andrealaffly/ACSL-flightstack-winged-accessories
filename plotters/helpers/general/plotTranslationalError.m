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

function [] = plotTranslationalError(log,title)

set(figure, 'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s, log.Error_in_position_x_m, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Error_in_position_y_m, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Error_in_position_z_m, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm x}(t)$$','$$e_{\rm y}(t)$$','$$e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, log.Error_in_velocity_x_ms, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Error_in_velocity_y_ms, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Error_in_velocity_z_ms, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm vx}(t)$$','$$e_{\rm vy}(t)$$','$$e_{\rm vz}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

