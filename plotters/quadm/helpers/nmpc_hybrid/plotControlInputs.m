%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the mixer inputs: the total thrust u1 and
% the three body moments u2, u3, u4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotControlInputs(log, title)

set(figure,'Color','White')

subplot(2,1,1)
plot(log.Controller_Time_s,log.u_1,'b-', 'LineWidth',2)
l= legend('$$u_{1}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.u_2,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.u_3,'g-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.u_4,'b--', 'LineWidth',2)
hold off
l= legend('$$u_{2}(t)$$','$$u_{3}(t)$$','$$u_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N m]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
