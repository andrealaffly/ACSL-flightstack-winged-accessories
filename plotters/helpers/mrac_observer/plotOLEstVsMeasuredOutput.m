%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the Inner loop K hat R gains along with the 
% projection operator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/12/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotOLEstVsMeasuredOutput(log, title)

% Figure 1 - Position data only
set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.y_estimated.x,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.outer_loop.observer.y_output.x,'r-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, x}(t)$$', '$$y_{\rm measured, x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.y_estimated.y,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.outer_loop.observer.y_output.y,'g-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, y}(t)$$', '$$y_{\rm measured, y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.y_estimated.z,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.outer_loop.observer.y_output.z,'b-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, z}(t)$$', '$$y_{\rm measured, z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

