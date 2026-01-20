%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated velocity error for the
% observer w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrVel(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.vx, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.vx, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{x}}$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.vy, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.vy, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{y}}$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, der.observer.mrao.obs_err.vz, 'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, der.observer.mrao2l.obs_err.vz, 'r-', 'LineWidth', 1.5)
hold off
l= legend('MRA0', '2L MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{z}}$$ [m/s]','interpreter','latex','fontsize',30)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

