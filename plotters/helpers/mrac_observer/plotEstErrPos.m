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
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.x),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.x),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.x),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.x),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
ylabel('$$\| e_x \|$$ [m]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.y),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.y),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.y),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.y),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
ylabel('$$\| e_y \|$$ [m]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.z),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.z),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.z),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.z),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2.5)
hold off
ylabel('$$\| e_z \|$$ [m]','interpreter','latex','fontsize',60)
axis tight
xlabel('t [s]','interpreter','latex','fontsize',60)

% Legend from third subplot
ax3 = subplot(3,1,3);
h  = get(ax3,'Children');   % handles in reverse plotting order
h_mrao   = h(4);
h_2l     = h(3);
h_vs     = h(2);
h_2lvs   = h(1);
leg = legend([h_mrao h_2l h_vs h_2lvs], ...
    'MRAO', '2L MRAO', 'MRAO VS', '2L MRAO VS', ...
    'Orientation','horizontal', 'Interpreter','latex', 'FontSize',40);
set(leg,'Location','southoutside');
end

