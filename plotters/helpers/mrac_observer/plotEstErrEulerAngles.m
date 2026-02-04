%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the observation error for euler angles for
% the differentiator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrEulerAngles(log,der,title)

set(figure,'Color','white')
subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.phi),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.phi), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.phi), 'c--', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.phi),   'g-',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\phi}$$ [deg]','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.theta),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.theta), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.theta), 'c--', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.theta),   'g-',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\theta}$$ [deg]','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.psi),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.psi), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.psi), 'c--', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.psi),   'g-',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\psi}$$ [deg]','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t$$ [s]','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);


end