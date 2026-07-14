%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired euler angles and the filtered
% euler angles in case of chattering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEulerActualDesiredFiltered(log, der, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s, rad2deg(der.roll_ji), 'k-', 'LineWidth', 1.5)
hold on
plot(log.Controller_Time_s, rad2deg(der.roll_d), 'r-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.fil.roll_ji), 'b-', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(der.fil.roll_d), 'm-.', 'LineWidth', 2)
hold off
l = legend('$$\phi_{ji}(t)$$', '$$\phi_{d}(t)$$', ...
           '$$\phi_{ji,\mathrm{fil}}(t)$$', '$$\phi_{d,\mathrm{fil}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s, rad2deg(der.pitch_ji), 'k-', 'LineWidth', 1.5)
hold on
plot(log.Controller_Time_s, rad2deg(der.pitch_d), 'r-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.fil.pitch_ji), 'b-', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(der.fil.pitch_d), 'm-.', 'LineWidth', 2)
hold off
l = legend('$$\theta_{ji}(t)$$', '$$\theta_{d}(t)$$', ...
           '$$\theta_{ji,\mathrm{fil}}(t)$$', '$$\theta_{d,\mathrm{fil}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s, rad2deg(der.yaw_ji), 'k-', 'LineWidth', 1.5)
hold on
plot(log.Controller_Time_s, rad2deg(der.yaw_d), 'r-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.fil.yaw_ji), 'b-', 'LineWidth', 2)
plot(log.Controller_Time_s, rad2deg(der.fil.yaw_d), 'm-.', 'LineWidth', 2)
hold off
l = legend('$$\psi_{ji}(t)$$', '$$\psi_{d}(t)$$', ...
           '$$\psi_{ji,\mathrm{fil}}(t)$$', '$$\psi_{d,\mathrm{fil}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',30)
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
axis tight
grid minor

sgtitle(title,'Interpreter','latex','FontSize',20);

end