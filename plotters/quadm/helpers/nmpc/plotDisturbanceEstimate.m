%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the disturbance acceleration estimate
% injected in the NMPC prediction model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDisturbanceEstimate(log, title)

set(figure,'Color','White')
plot(log.Controller_Time_s,log.d_hat_x,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.d_hat_y,'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.d_hat_z,'b-', 'LineWidth',2)
hold off
l= legend('$$\hat{d}_{x}(t)$$','$$\hat{d}_{y}(t)$$','$$\hat{d}_{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
