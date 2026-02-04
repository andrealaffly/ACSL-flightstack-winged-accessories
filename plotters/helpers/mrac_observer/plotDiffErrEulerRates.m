%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the observation error for euler rates for
% the differentiator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/20/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDiffErrEulerRates(log,der,title)

set(figure,'Color','white')
subplot(3,1,1)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.phi_dot),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.phi_dot), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.phi_dot), 'g-.', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.phi_dot),   'c--',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{\phi}}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.theta_dot),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.theta_dot), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.theta_dot), 'g-.', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.theta_dot),   'c-',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{\theta}}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad.error.psi_dot),   'b-.', 'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l.error.psi_dot), 'r-',  'LineWidth', 1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_vs.error.psi_dot), 'g-.', 'LineWidth',1.5)
plot(log.Controller_Time_s, rad2deg(der.differentiator.mrad_2l_vs.error.psi_dot),   'c-',  'LineWidth',1.5)
hold off
l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$e_{\dot{\psi}}$$ [deg/s]','interpreter','latex','fontsize',30)
axis tight
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
sgtitle(title,'Interpreter','latex','FontSize',20);


end