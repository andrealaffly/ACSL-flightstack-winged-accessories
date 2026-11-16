%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user velocity, reference model
% velocity and the actual velocity of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotVelocityActualReferenceUser(log, title)

set(figure,'Color', 'white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.vx_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.vx_ref,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.vx_ms,'k-','LineWidth',2)
hold off
l= legend('$$v_{x,{\rm cmd}}(t)$$', '$$v_{x,{\rm ref}}(t)$$', '$$v_{x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.vy_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.vy_ref,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.vy_ms,'k-','LineWidth',2)
hold off
l= legend('$$v_{y,{\rm cmd}}(t)$$', '$$v_{y,{\rm ref}}(t)$$', '$$v_{y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.vz_user,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.vz_ref,'b--','LineWidth',2)
plot(log.Controller_Time_s,log.vz_ms,'k-','LineWidth',2)
hold off
l= legend('$$v_{z,{\rm cmd}}(t)$$','$$v_{z,{\rm ref}}(t)$$','$$v_{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
