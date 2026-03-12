%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user position and the actual
% position of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotPosTraj(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.x_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.x_m,'k-','LineWidth',2)
hold off
l= legend('$$x_{\rm cmd}(t)$$','$$x(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.y_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.y_m,'k-','LineWidth',2)
hold off
l= legend('$$y_{\rm cmd}(t)$$','$$y(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.z_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.z_m,'k-','LineWidth',2)
hold off
l= legend('$$z_{\rm cmd}(t)$$','$$z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

