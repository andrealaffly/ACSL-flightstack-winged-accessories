%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the coefficeints of Lift, Drag and Moments
% for the wings and stabilizers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotAeroCoeff(log,title)

set(figure,'Color', 'white')

subplot(3,1,1)
scatter(log.Controller_Time_s, log.aero.Cl_up, 'g.', 'LineWidth',1.5);
hold on
scatter(log.Controller_Time_s, log.aero.Cl_lw, 'b.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cl_lt, 'k.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cl_rt, 'r.', 'LineWidth',1.5);
hold off
l = legend('$$C_{l_{\rm upper}}$$', '$$C_{l_{\rm lower}}$$', ...
           '$$C_{l_{\rm left}}$$', '$$C_{l_{\rm right}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$C_{l}$$ [-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
scatter(log.Controller_Time_s, log.aero.Cd_up, 'g.', 'LineWidth',1.5);
hold on
scatter(log.Controller_Time_s, log.aero.Cd_lw, 'b.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cd_lt, 'k.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cd_rt, 'r.', 'LineWidth',1.5);
hold off
l = legend('$$C_{d_{\rm upper}}$$', '$$C_{d_{\rm lower}}$$', ...
           '$$C_{d_{\rm left}}$$', '$$C_{d_{\rm right}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$C_{d}$$ [-]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
scatter(log.Controller_Time_s, log.aero.Cm_up, 'g.', 'LineWidth',1.5);
hold on
scatter(log.Controller_Time_s, log.aero.Cm_lw, 'b.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cm_lt, 'k.', 'LineWidth',1.5);
scatter(log.Controller_Time_s, log.aero.Cm_rt, 'r.', 'LineWidth',1.5);
hold off
l = legend('$$C_{m_{\rm upper}}$$', '$$C_{m_{\rm lower}}$$', ...
           '$$C_{m_{\rm left}}$$', '$$C_{m_{\rm right}}$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$C_{l}$$ [-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle(title,'Interpreter','latex','FontSize',20);

end

