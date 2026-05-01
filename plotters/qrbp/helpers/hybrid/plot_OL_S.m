%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the OUTER LOOP series element s and s.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 04/3/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plot_OL_S(log,title)

set(figure,'Color','White')

subplot(2,1,1)
plot(log.Controller_Time_s,log.hybrid.tran.s, 'b-', 'LineWidth',2)
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l= legend('$$s$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.hybrid.tran.s_element,'r-', 'LineWidth',2)
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.tran.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l = legend('$$s_{\rm element}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
