%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the individual motor thrusts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotMotorThrusts(log,title)

set(figure,'Color','White')

subplot(2,1,1)
plot(log.Controller_Time_s,log.Thrust_Motor_1_N,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Thrust_Motor_2_N,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_3_N,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_4_N,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Thrust_Motor_1_Normalized_N,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Thrust_Motor_2_Normalized_N,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_3_Normalized_N,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_4_Normalized_N,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
