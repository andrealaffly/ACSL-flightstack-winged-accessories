%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the L2 norm of the outerloop errors over t
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 05/10/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = plotL2NormsTranslational(log, der, title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,der.L2_norm_pos,'k-','LineWidth',2)
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm pos}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,der.L2_norm_vel,'k-','LineWidth',2)
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm vel}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.L2_norm_combined_tran,'k-','LineWidth',2)
ylabel('$$\sqrt{\int_0^t \Vert e_{\rm total}(\tau) \Vert^2 {\rm d} \tau}$$','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

