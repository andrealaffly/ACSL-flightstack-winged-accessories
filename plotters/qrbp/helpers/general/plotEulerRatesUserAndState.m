%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired angular rates and the state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEulerRatesUserAndState(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_phi_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_x_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\phi}_{\rm desired}(t)$$','$$\dot{\phi}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_theta_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_y_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\theta}_{\rm desired}(t)$$','$$\dot{\theta}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_psi_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_z_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\psi}_{\rm desired}(t)$$','$$\dot{\psi(}t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

