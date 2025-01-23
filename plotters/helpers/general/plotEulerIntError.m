%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the integral error in the Euler angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEulerIntError(log,title)

set(figure,'Color','White')

plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_phi_rads), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_theta_rads), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_psi_rads), 'LineWidth',2)
hold off
l= legend('$$\int e_{\phi}(t)$$','$$\int e_{\theta}(t)$$','$$\int e_{\psi}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

