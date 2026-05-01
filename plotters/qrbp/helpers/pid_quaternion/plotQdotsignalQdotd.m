%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the component wise differentiated q_signal
% and the one with the orthogonality condition implement q_d_dot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotQdotsignalQdotd(log,title)

set(figure,'Color','white')

subplot(4,1,1)
plot(log.Controller_Time_s,log.q_signal_dot_w, 'k-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_dot_w, 'k-', 'LineWidth', 2)
hold off
l= legend('$$\dot{\mathbf{q}}_{\rm signal} w$$', ...
          '$$\dot{\mathbf{q}}_{\rm d} w$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,2)
plot(log.Controller_Time_s,log.q_signal_dot_x, 'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_dot_x, 'r-', 'LineWidth', 2)
hold off
l= legend('$$\dot{\mathbf{q}}_{\rm signal} x$$', ...
          '$$\dot{\mathbf{q}}_{\rm align} x$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,3)
plot(log.Controller_Time_s,log.q_signal_dot_y, 'g-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_dot_y, 'g-', 'LineWidth', 2)
hold off
l= legend('$$\dot{\mathbf{q}}_{\rm signal} y$$', ...
          '$$\dot{\mathbf{q}}_{\rm align} y$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,4)
plot(log.Controller_Time_s,log.q_signal_dot_z, 'b-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.q_align_dot_z, 'b-', 'LineWidth', 2)
hold off
l= legend('$$\dot{\mathbf{q}}_{\rm signal} z$$', ...
          '$$\dot{\mathbf{q}}_{\rm align} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

