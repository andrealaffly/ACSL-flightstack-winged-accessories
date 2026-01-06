%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the measured states vs the estimated states
% of the uav w.r.t time.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/12/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotOLEstVsMeasuredStates(log, title)

% Figure 1 - Position data only
set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.x,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_x_m,'r-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm x}(t)$$', '$$X_{\rm x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.y,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_y_m,'g-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm y}(t)$$', '$$X_{\rm y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.z,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_z_m,'b-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm z}(t)$$', '$$X_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

% Figure 2 - Velocities
set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.vx,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Velocity_x_ms,'r-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm vx}(t)$$', '$$X_{\rm vx}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.vy,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Velocity_y_ms,'g-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm vy}(t)$$', '$$X_{\rm vy}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s,log.outer_loop.observer.x_hat_estimated.vz,'k--','LineWidth',2)
plot(log.Controller_Time_s,log.Velocity_z_ms,'b-','LineWidth',2)
hold off
l= legend('$$\hat{X}_{\rm vz}(t)$$', '$$X_{\rm vz}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

