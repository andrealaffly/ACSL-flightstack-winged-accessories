%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the time-series L2 norm of the
% translational position error, velocity error and the combined 6D error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotL2NormsTranslational(log, der, title)

set(figure,'Color','White')
plot(log.Controller_Time_s,der.L2_norm_pos,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.L2_norm_vel,'g-', 'LineWidth',2)
plot(log.Controller_Time_s,der.L2_norm_combined_tran,'b-', 'LineWidth',2)
hold off
l= legend('$$\|e_{\rm pos}\|_{L_2}(t)$$','$$\|e_{\rm vel}\|_{L_2}(t)$$','$$\|e\|_{L_2}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
