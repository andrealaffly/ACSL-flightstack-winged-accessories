%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the x vs z states plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotTranslationalXvsZ(log,title)

set(figure,'Color','white')

plot(log.Position_x_m,log.Position_z_m,'k-','LineWidth',2)
hold on
plot(log.User_Position_x_m,log.User_Position_z_m,'r-.','LineWidth',2)
hold off
l= legend('$$r$$','$$r_{\rm cmd}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$z \, {\rm [m]}$$','interpreter','latex','fontsize',30)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$x \, {\rm [m]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

