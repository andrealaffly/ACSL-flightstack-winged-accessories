%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the outerloop virtual controls in the
% inertial and the body frame w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDesiredAxisAndThrust(log,der,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,der.Fd, 'k-', 'LineWidth',2)
l= legend('$$F_d$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.f_d_hat_x, 'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.f_d_hat_y, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.f_d_hat_z, 'b-', 'LineWidth',2)
hold off
l= legend('$$\hat{F}_{d, x}^{\mathbf{J}}$$', ...
          '$$\hat{F}_{d, y}^{\mathbf{J}}$$', ...
          '$$\hat{F}_{d, z}^{\mathbf{J}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

