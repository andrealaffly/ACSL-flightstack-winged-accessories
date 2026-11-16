%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the translational reference command
% (Eq. (52)) generated from the outer NMPC plan against the actual position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalReferenceCommand(log, title)

set(figure,'Color','White')
plot(log.Controller_Time_s,log.x_ref_cmd,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.y_ref_cmd,'g-', 'LineWidth',2)
plot(log.Controller_Time_s,log.z_ref_cmd,'b-', 'LineWidth',2)
hold off
l= legend('$$r_{{\rm cmd},x}(t)$$','$$r_{{\rm cmd},y}(t)$$','$$r_{{\rm cmd},z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
