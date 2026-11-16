%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the translational position error with the
% hybrid reset events overlaid, along with the cumulative reset count and
% the time of the last reset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotHybridResetEvents(log, title)

set(figure,'Color','White')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, log.e_x, 'r-', 'LineWidth',2)
plot(log.Controller_Time_s, log.e_y, 'g-', 'LineWidth',2)
plot(log.Controller_Time_s, log.e_z, 'b-', 'LineWidth',2)
hold off
plot_event_lines(log.Controller_Time_s, log.hybrid_reset_triggered, 'reset', 'k--');
l= legend('$$e_{x}(t)$$','$$e_{y}(t)$$','$$e_{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
stairs(log.Controller_Time_s, log.number_of_hybrid_resets, 'k-', 'LineWidth',2)
l= legend('${\rm \# \, resets}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
stairs(log.Controller_Time_s, log.time_of_last_hybrid_reset, 'k-', 'LineWidth',2)
l= legend('${\rm time \, of \, last \, reset}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
