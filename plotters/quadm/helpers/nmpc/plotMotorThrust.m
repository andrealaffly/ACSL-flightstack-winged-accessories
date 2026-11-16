%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the individual motor thrusts: the raw
% thrust commanded by the mixer, the saturated thrust and the normalized
% thrust sent to the actuators
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotMotorThrust(log,title)

set(figure,'Color','White')

subplot(3,1,1)
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

subplot(3,1,2)
plot(log.Controller_Time_s,log.Motor_1_Sat_Thrust_N,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Motor_2_Sat_Thrust_N,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_3_Sat_Thrust_N,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_4_Sat_Thrust_N,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1,{\rm sat}}(t)$$','$$T_{2,{\rm sat}}(t)$$','$$T_{3,{\rm sat}}(t)$$','$$T_{4,{\rm sat}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Motor_1_Norm_Thrust,'b-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Motor_2_Norm_Thrust,'r-.', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_3_Norm_Thrust,'g--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Motor_4_Norm_Thrust,'k-', 'LineWidth',1)
hold off
l= legend('$$T_{1,{\rm norm}}(t)$$','$$T_{2,{\rm norm}}(t)$$','$$T_{3,{\rm norm}}(t)$$','$$T_{4,{\rm norm}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end
