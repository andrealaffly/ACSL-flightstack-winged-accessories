%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the attitude error e_R (Eq. (78)) used by
% the angular velocity command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAttitudeError(log, title)

set(figure,'Color','White')
plot(log.Controller_Time_s,log.e_R_x,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_R_y,'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.e_R_z,'b-', 'LineWidth',2)
hold off
l= legend('$$e_{R,x}(t)$$','$$e_{R,y}(t)$$','$$e_{R,z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
