%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the error in the reference model w.r.t the
% user command and the integral of the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/29/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotRefModelErrRot(log,title)

set(figure, 'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s, log.Reference_Error_omega_x, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Reference_Error_omega_y, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Reference_Error_omega_z, 'LineWidth', 2)
hold off
l= legend('$$e_{\omega_{\rm x,ref}}(t)$$', ...
          '$$e_{\omega_{\rm y,ref}}(t)$$', ...
          '$$e_{\omega_{\rm z,ref}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, log.Integral_Reference_Error_omega_x, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Integral_Reference_Error_omega_y, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Integral_Reference_Error_omega_z, 'LineWidth', 2)
hold off
l= legend('$$\int e_{\omega_{\rm x,ref}}(t)$$', ...
          '$$\int e_{\omega_{\rm y,ref}}(t)$$', ...
          '$$\int e_{\omega_{\rm z,ref}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
