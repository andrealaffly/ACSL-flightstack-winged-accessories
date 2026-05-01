%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the individual motor thrusts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotMotorControl(log,title)

set(figure,'Color','White')

subplot(2,1,1)
plot(log.Controller_Time_s,log.Motor_1_Thrust_N,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Motor_2_Thrust_N,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_3_Thrust_N,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_4_Thrust_N,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Motor_1_Thr_Sat_Norm,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Motor_2_Thr_Sat_Norm,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_3_Thr_Sat_Norm,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_4_Thr_Sat_Norm,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
