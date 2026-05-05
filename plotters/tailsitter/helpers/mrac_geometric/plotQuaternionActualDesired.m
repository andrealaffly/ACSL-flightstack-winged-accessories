%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired quaternion and the orientation
% quaternion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotQuaternionActualDesired(log,der,title)

set(figure,'Color','white')

subplot(4,1,1)
plot(log.Controller_Time_s,der.R_d_quat(:,1), 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.R_ji_quat(:,1), 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d w$$', ...
          '$$\mathbf{q} w$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,2)
plot(log.Controller_Time_s,der.R_d_quat(:,2), 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.R_ji_quat(:,2), 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d x$$', ...
          '$$\mathbf{q} x$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,3)
plot(log.Controller_Time_s,der.R_d_quat(:,3), 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.R_ji_quat(:,3), 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d y$$', ...
          '$$\mathbf{q} y$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,4)
plot(log.Controller_Time_s,der.R_d_quat(:,4), 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.R_ji_quat(:,4), 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d z$$', ...
          '$$\mathbf{q} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

