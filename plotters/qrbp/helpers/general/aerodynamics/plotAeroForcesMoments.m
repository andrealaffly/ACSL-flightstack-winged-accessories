%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the aerodynamic forces and moments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAeroForcesMoments(log,title)

set(figure,'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s, log.aero.F_x, 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, log.aero.F_y, 'LineWidth', 2);
plot(log.Controller_Time_s, log.aero.F_z, 'LineWidth', 2);
hold off
l = legend('$$F_{\rm x}^{\mathbf{W}}$$', '$$F_{\rm y}^{\mathbf{W}}$$', ...
           '$$F_{\rm z}^{\mathbf{W}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, log.aero.M_x, 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, log.aero.M_y, 'LineWidth', 2);
plot(log.Controller_Time_s, log.aero.M_z, 'LineWidth', 2);
hold off
l = legend('$$M_{\rm x}$$', '$$M_{\rm y}$$', '$$M_{\rm z}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

