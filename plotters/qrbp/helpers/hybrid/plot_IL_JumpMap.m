%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the jump map for resetting events
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 04/7/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plot_IL_JumpMap(log,title)

set(figure,'Color','White')

hold on 
plot(log.Controller_Time_s, log.hybrid.rot.jump_map.ox, 'r-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.rot.jump_map.oy, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.rot.jump_map.oz, 'b-', 'LineWidth',2)
hold off
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l = legend('$$\omega_x$$', '$$\omeag_y$$', '$$\omega_z$$');
set(l,'interpre')
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

