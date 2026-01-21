%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the L2 norm of the estimation errors w.r.t
% time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrL2Norm(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_combined, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_combined, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm total}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_pos, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_pos, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm pos}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, der.observer.mrao.L2_norm_vel, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.L2_norm_vel, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm vel}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

