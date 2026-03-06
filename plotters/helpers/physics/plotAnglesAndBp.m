function [] = plotAnglesAndBp(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot phi, theta, psi and their body-frame counterparts *_bp vs time (deg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;

phi_deg      = rad2deg(body.phi);
phi_bp_deg   = rad2deg(body.phi_bp);
theta_deg    = rad2deg(body.theta);
theta_bp_deg = rad2deg(body.theta_bp);
psi_deg      = rad2deg(body.psi);
psi_bp_deg   = rad2deg(body.psi_bp);

subplot(3,1,1)
plot(t, phi_deg,    'r-',  'LineWidth', 2); hold on
plot(t, phi_bp_deg, 'b--', 'LineWidth', 2); hold off
l = legend('$$\phi(t)$$', '$$\phi_{\rm bp}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\phi \,[{\rm deg}]$$','interpreter','latex','fontsize',20)
axis tight; grid minor

subplot(3,1,2)
plot(t, theta_deg,    'r-',  'LineWidth', 2); hold on
plot(t, theta_bp_deg, 'b--', 'LineWidth', 2); hold off
l = legend('$$\theta(t)$$', '$$\theta_{\rm bp}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\theta \,[{\rm deg}]$$','interpreter','latex','fontsize',20)
axis tight; grid minor

subplot(3,1,3)
plot(t, psi_deg,    'r-',  'LineWidth', 2); hold on
plot(t, psi_bp_deg, 'b--', 'LineWidth', 2); hold off
l = legend('$$\psi(t)$$', '$$\psi_{\rm bp}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\psi \,[{\rm deg}]$$','interpreter','latex','fontsize',20)
xlabel('$$t \,[{\rm s}]$$','interpreter','latex','fontsize',20)
axis tight; grid minor

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
