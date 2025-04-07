%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the INNER LOOP e' * Q * e and the integral
% vs summation P.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 04/3/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plot_IL_eTQe_Sum_P(log,title)

set(figure,'Color','White')

subplot(2,1,1)
plot(log.Controller_Time_s,log.hybrid.rot.e_transpose_Q_e, 'b-', 'LineWidth',2)
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.rot.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.rot.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l= legend('$$e^T Qe_{\rm rot}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
hold on
plot(log.Controller_Time_s,log.hybrid.rot.e_transpose_Q_e_I,'r-', 'LineWidth',2)
plot(log.Controller_Time_s,log.hybrid.rot.summation_P,'b-','LineWidth',2)
hold off
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.rot.hybrid_reset_condition_verified_flag, ...
                 'reset', 'k--');
plot_event_lines(log.Controller_Time_s, ...
                 log.hybrid.rot.summation_condition_hybrid_verified_flag, ...
                 'summation', 'k-.');
l= legend('$$\int e^T Qe_{\rm rot}$$', ...
          '$$\sum e_{i}^{\rm T} P e_{i} - e_{i-1}^{\rm T} P e_{i-1}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

