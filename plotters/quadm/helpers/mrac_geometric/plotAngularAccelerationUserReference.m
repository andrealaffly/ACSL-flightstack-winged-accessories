%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user acceleration and the 
% reference model acceleration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 07/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAngularAccelerationUserReference(log,title)

set(figure,'Color','white')

subplot(3,1,1)
plot(log.Controller_Time_s,log.alpha_d_x,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_x_ref,'b--','LineWidth',2)
hold off
l= legend('$$\alpha_{\rm x, user}(t)$$','$$\alpha_{\rm x, ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$[{\rm{rad}}/{\rm{s}}^2]$$','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.alpha_d_y,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_y_ref,'b--','LineWidth',2)
hold off
l= legend('$$\alpha_{\rm y, user}(t)$$','$$\alpha_{\rm y, ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$[{\rm{rad}}/{\rm{s}}^2]$$','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.alpha_d_z,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.alpha_z_ref,'b--','LineWidth',2)
hold on
l= legend('$$\alpha_{\rm z, user}(t)$$','$$\alpha_{\rm z, ref}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$[{\rm{rad}}/{\rm{s}}^2]$$','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

