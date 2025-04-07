%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the jump map for resetting events
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 04/7/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plot_OL_JumpMap(log,title)

set(figure,'Color','White')

subplot(2,1,1)
hold on 
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.x, 'r-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.y, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.z, 'b-', 'LineWidth',2)
hold off
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l = legend('$$x$$', '$$y$$', '$$z$$');
set(l,'interpre')
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
hold on 
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.vx, 'r-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.vy, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s, log.hybrid.tran.jump_map.vz, 'b-', 'LineWidth',2)
hold off
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l = legend('$$vx$$', '$$vy$$', '$$vz$$');
set(l,'interpre')
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

