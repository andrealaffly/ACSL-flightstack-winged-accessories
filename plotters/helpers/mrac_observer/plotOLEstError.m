%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimation error for the outerloop
% adaptive observer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/12/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotOLEstError(log, title)

% Figure 1 - Position data only
set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.x,'r-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, x}(t) - y_{\rm measured, x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.y,'g-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, y}(t) - y_{\rm measured, y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.z,'g-','LineWidth',2)
hold off
l= legend('$$y_{\rm estimated, z}(t) - y_{\rm measured, z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

