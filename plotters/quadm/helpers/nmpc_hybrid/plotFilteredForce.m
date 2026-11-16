%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the filtered (command generator) force
% against the total translational force
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotFilteredForce(log, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.mu_x_total,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_x_filtered,'r-.', 'LineWidth',2)
hold off
l= legend('$$\mu_{x,{\rm total}}(t)$$','$$\mu_{x,{\rm filtered}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.mu_y_total,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_y_filtered,'r-.', 'LineWidth',2)
hold off
l= legend('$$\mu_{y,{\rm total}}(t)$$','$$\mu_{y,{\rm filtered}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.mu_z_total,'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_z_filtered,'r-.', 'LineWidth',2)
hold off
l= legend('$$\mu_{z,{\rm total}}(t)$$','$$\mu_{z,{\rm filtered}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
