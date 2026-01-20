%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated position error for the
% observer w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrPos(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.x, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.x, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_x$$ [m]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.y, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.y, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_y$$ [m]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.z, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.z, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_z$$ [m]','interpreter','latex','fontsize',30)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

