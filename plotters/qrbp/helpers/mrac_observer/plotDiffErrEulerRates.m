%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the observation error for euler rates for
% the differentiator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/40/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotDiffErrEulerRates(log,der,title)

set(figure,'Color','white')
subplot(3,1,1)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad.error.phi_dot)),   'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.phi_dot)), 'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_vs.error.phi_dot)), 'g-.', 'LineWidth',2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l_vs.error.phi_dot)),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\phi}}\|$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad.error.theta_dot)),   'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.theta_dot)), 'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_vs.error.theta_dot)), 'g-.', 'LineWidth',2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l_vs.error.theta_dot)),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\theta}}\|$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad.error.psi_dot)),   'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l.error.psi_dot)), 'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_vs.error.psi_dot)), 'g-.', 'LineWidth',2.5)
plot(log.Controller_Time_s, abs(rad2deg(der.differentiator.mrad_2l_vs.error.psi_dot)),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
% l = legend('MRAO', '2L MRAO', 'VS MRAO', '2L VS MRAO');
% set(l,'interpreter','latex','fontsize',15);
ylabel('$$\|e_{\dot{\psi}}\|$$ [deg/s]','interpreter','latex','fontsize',60)
axis tight
xlabel('t [s]','interpreter','latex','fontsize',60)
% sgtitle(title,'Interpreter','latex','FontSize',40);

% -------- Single horizontal legend at the top (using lines from subplot 1) --------
ax3 = subplot(3,1,3);
h  = get(ax3,'Children');   % handles in reverse plotting order: last plotted is h(1)
% Reorder to: CHRONO, integral, MRAO, 2L MRAO, MRAO VS, 2L MRAO VS
h_mrao   = h(4);
h_2l     = h(3);
h_vs     = h(2);
h_2lvs   = h(1);
leg = legend([h_mrao h_2l h_vs h_2lvs], ...
    'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS', ...
    'Orientation','horizontal', 'Interpreter','latex', 'FontSize',40);
set(leg,'Location','southoutside');


end