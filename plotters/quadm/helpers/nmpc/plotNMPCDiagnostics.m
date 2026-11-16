%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the NMPC solver diagnostics: the initial
% and final cost of the Gauss-Newton solve, the accepted iterations and
% the accepted line search step
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotNMPCDiagnostics(log, title)

set(figure,'Color','White')

subplot(4,1,1)
plot(log.Controller_Time_s,log.cost_initial,'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.cost_final,'k-', 'LineWidth',2)
hold off
l= legend('$$J_{\rm initial}(t)$$','$$J_{\rm final}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,2)
plot(log.Controller_Time_s,log.iterations,'b-', 'LineWidth',2)
l= legend('${\rm iterations}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,3)
plot(log.Controller_Time_s,log.alpha,'g-', 'LineWidth',2)
l= legend('$$\alpha(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(4,1,4)
plot(log.Controller_Time_s,log.Alg_exe_time,'k-', 'LineWidth',2)
l= legend('${\rm exec. \, time}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[$$\mu$$s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
