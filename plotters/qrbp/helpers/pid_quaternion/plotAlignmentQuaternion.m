%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the q_align and q_align_star for the
% orientation computation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAlignmentQuaternion(log,title)

set(figure,'Color','white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.q_align_w, 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_x, 'r-', 'LineWidth', 2)
plot(log.Controller_Time_s,log.q_align_y, 'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.q_align_z, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mathbf{q}_{\rm align} w$$', ...
          '$$\mathbf{q}_{\rm align} x$$', ...
          '$$\mathbf{q}_{\rm align} y$$', ...
          '$$\mathbf{q}_{\rm align} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.q_align_star_w, 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_star_x, 'r-', 'LineWidth', 2)
plot(log.Controller_Time_s,log.q_align_star_y, 'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.q_align_star_z, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mathbf{q}_{\rm align}^{*} w$$', ...
          '$$\mathbf{q}_{\rm align}^{*} x$$', ...
          '$$\mathbf{q}_{\rm align}^{*} y$$', ...
          '$$\mathbf{q}_{\rm align}^{*} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

