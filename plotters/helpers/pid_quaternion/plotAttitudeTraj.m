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

function [] = plotAttitudeTraj(log,title)

set(figure,'Color','white')

subplot(4,1,1)
plot(log.Controller_Time_s,log.q_d_w, 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_w, 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d w$$', ...
          '$$\mathbf{q} w$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,2)
plot(log.Controller_Time_s,log.q_d_x, 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_x, 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d x$$', ...
          '$$\mathbf{q} x$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,3)
plot(log.Controller_Time_s,log.q_d_y, 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_y, 'k-', 'LineWidth', 2)
hold off
l= legend('$$\mathbf{q}_d y$$', ...
          '$$\mathbf{q} y$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,4)
plot(log.Controller_Time_s,log.q_d_z, 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_z, 'k-', 'LineWidth', 2)
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

