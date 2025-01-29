%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user position, reference model 
% position and the actual position of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotPosRefUser(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.User_Position_x_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Position_x_m,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_x_m,'k-','LineWidth',2)
hold off
l= legend('$$x_{\rm cmd}(t)$$', '$$x_{\rm ref}(t)$$', '$$x(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.User_Position_y_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Position_y_m,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_y_m,'k-','LineWidth',2)
hold off
l= legend('$$y_{\rm cmd}(t)$$', '$$y_{\rm ref}(t)$$', '$$y(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.User_Position_z_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Ref_Position_z_m,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.Position_z_m,'k-','LineWidth',2)
hold off
l= legend('$$z_{\rm cmd}(t)$$','$$z_{\rm ref}(t)$$','$$z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);


end

