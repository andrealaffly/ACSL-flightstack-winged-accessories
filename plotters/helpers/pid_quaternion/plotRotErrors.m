%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the error in the Euler angles and the
% angular velocities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotRotErrors(log,title)

set(figure,'Color','White')

subplot(2,1,1)
hold on
plot(log.Controller_Time_s,log.q_e_x, 'r-', 'LineWidth', 2)
plot(log.Controller_Time_s,log.q_e_y, 'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.q_e_z, 'b-', 'LineWidth',2)
hold off
l= legend('$$\mathbf{q}_{\rm e} x$$', ...
          '$$\mathbf{q}_{\rm e} y$$', ...
          '$$\mathbf{q}_{\rm e} z$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.omega_e_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_e_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_e_z, 'LineWidth',2)
hold off
l= legend('$$e_{\omega,x}(t)$$','$$e_{\omega,y}(t)$$','$$e_{\omega,z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

