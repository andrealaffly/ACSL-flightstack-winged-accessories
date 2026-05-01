%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated euler rates and the actual
% euler rates of the uav w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrEulerAnglesLL(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.phi)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\phi}\|$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.theta)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\theta}\|$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.psi)), 'r-', 'LineWidth', 2.5)
hold off
l= legend('DIFF');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\psi}\|$$ [deg]','interpreter','latex','fontsize',30)
axis tight
grid minor
xlabel('t [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',30);

end

