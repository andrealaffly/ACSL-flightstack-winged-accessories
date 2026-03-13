%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the baseline Moment setpoints in the inner 
% loop.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTau(log,title)

set(figure,'Color','white')

plot(log.Controller_Time_s,log.tau_x,'r-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.tau_y,'g-', 'LineWidth',2)  
plot(log.Controller_Time_s,log.tau_z,'b-', 'LineWidth',2)
hold off
l= legend('$$\tau_{\rm x,baseline}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm y,baseline}^{\mathbf{J}}(t)$$', ...
          '$$\tau_{\rm z,baseline}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

