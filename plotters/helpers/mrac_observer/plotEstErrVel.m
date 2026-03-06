%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the estimated velocity error for the
% observer w.r.t time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/40/4026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotEstErrVel(log,der,title)

set(figure,'Color', 'white')

subplot(3,1,1)
hold on
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.vx),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.vx),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.vx),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.vx),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
ylabel('$$\| e_{vx} \|$$ [m/s]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,2)
hold on
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.vy),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.vy),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.vy),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.vy),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
ylabel('$$\| e_{vy} \|$$ [m/s]','interpreter','latex','fontsize',60)
axis tight

subplot(3,1,3)
hold on
plot(log.Controller_Time_s, abs(der.observer.mrao.obs_err.vz),    'b-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2l.obs_err.vz),  'r-',  'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mraovs.obs_err.vz),  'g-.', 'LineWidth', 2.5)
plot(log.Controller_Time_s, abs(der.observer.mrao2lvs.obs_err.vz),'LineStyle','-',  'Color',[0.7 0 1], 'LineWidth',2)
hold off
ylabel('$$\| e_{vz} \|$$ [m/s]','interpreter','latex','fontsize',60)
axis tight
xlabel('t [s]','interpreter','latex','fontsize',60)
ax3 = gca;

% Legend from third subplot
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

