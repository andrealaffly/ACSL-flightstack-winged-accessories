%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the L2 Norm of the errors of the 
% differentiator of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotL2NormDifferentiator(log,der,title)

set(figure,'Color','white')
subplot(2,1,1)
hold on
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad.euler,      'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l.euler,    'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_vs.euler,    'c--', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l_vs.euler,  'g-',  'LineWidth', 1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm euler}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight

subplot(2,1,2)
hold on
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad.euler_dot,      'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l.euler_dot,    'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_vs.euler_dot,    'c--', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.differentiator.L2norm.mrad_2l_vs.euler_dot,  'g-',  'LineWidth', 1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm{euler\, \, rate}}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end