%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the aerodynamic angles of attack and
% sideslip
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAeroAngles(log,title)

set(figure,'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s, rad2deg(log.aero.alpha), 'k-', 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, rad2deg(log.aero.alpha_up), 'b--', 'LineWidth', 2);
plot(log.Controller_Time_s, rad2deg(log.aero.alpha_lw), 'r-.', 'LineWidth', 2);
hold off
l = legend('$$\alpha_{\rm COG}$$', '$$\alpha_{l_{\rm upper}}$$', ...
           '$$\alpha_{l_{\rm lower}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, rad2deg(log.aero.beta), 'k-', 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, rad2deg(log.aero.beta_lt), 'g--', 'LineWidth', 2);
plot(log.Controller_Time_s, rad2deg(log.aero.beta_rt), 'm-.', 'LineWidth', 2);
hold off
l = legend('$$\beta_{\rm COG}$$', '$$\beta_{l_{\rm left}}$$', ...
           '$$\beta_{l_{\rm right}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

