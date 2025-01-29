%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the aerodynamic inversion terms for the
% baseline controller
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAeroDynInv(log,title)

set(figure,'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s, log.aero.outer_loop_dyn_inv_x, 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, log.aero.outer_loop_dyn_inv_y, 'LineWidth', 2);
plot(log.Controller_Time_s, log.aero.outer_loop_dyn_inv_z, 'LineWidth', 2);
hold off
l = legend('$$F_{\rm x}^{\mathbf{I}}$$', '$$F_{\rm y}^{\mathbf{I}}$$', ...
           '$$F_{\rm z}^{\mathbf{I}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, log.aero.inner_loop_dyn_inv_x, 'LineWidth', 2);
hold on 
plot(log.Controller_Time_s, log.aero.inner_loop_dyn_inv_y, 'LineWidth', 2);
plot(log.Controller_Time_s, log.aero.inner_loop_dyn_inv_z, 'LineWidth', 2);
hold off
l = legend('$$M_{\rm x}^{\mathbf{J}}$$', '$$M_{\rm y}^{\mathbf{J}}$$', ...
           '$$M_{\rm z}^{\mathbf{J}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

