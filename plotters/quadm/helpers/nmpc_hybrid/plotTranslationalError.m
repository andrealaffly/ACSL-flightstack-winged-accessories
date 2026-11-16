%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the translational position and velocity
% errors w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalError(log, title)

set(figure,'Color', 'white')

subplot(2,1,1)
plot(log.Controller_Time_s,log.e_x,'r-','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_y,'g-','LineWidth',2)
plot(log.Controller_Time_s,log.e_z,'b-','LineWidth',2)
hold off
l= legend('$$e_{x}(t)$$', '$$e_{y}(t)$$', '$$e_{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.e_vx,'r-','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_vy,'g-','LineWidth',2)
plot(log.Controller_Time_s,log.e_vz,'b-','LineWidth',2)
hold off
l= legend('$$e_{v_x}(t)$$', '$$e_{v_y}(t)$$', '$$e_{v_z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
