%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired yaw quaternion.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDesiredYawQuaternion(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,rad2deg(log.psi_user), 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.psi_user_unwrapped), 'k-.', 'LineWidth', 2)
hold off
l= legend('$$\psi_{\rm user}$$', ...
          '$$\psi_{\rm user, unwrapped}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.q_yaw_w, 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_yaw_x, 'r-', 'LineWidth', 2)
plot(log.Controller_Time_s,log.q_yaw_y, 'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.q_yaw_z, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mathbf{q}_{\rm yaw} w$$', ...
          '$$\mathbf{q}_{\rm yaw} x$$', ...
          '$$\mathbf{q}_{\rm yaw} y$$', ...
          '$$\mathbf{q}_{\rm yaw} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

