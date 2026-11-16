%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the integral of the translational position
% error, used by the NMPC disturbance estimate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalIntError(log, title)

set(figure,'Color','White')
plot(log.Controller_Time_s,log.e_x_int,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_y_int,'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.e_z_int,'b-', 'LineWidth',2)
hold off
l= legend('$$\int e_{x}(t) \, dt$$','$$\int e_{y}(t) \, dt$$','$$\int e_{z}(t) \, dt$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
