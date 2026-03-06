function [] = plotAngleAndOmega(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot angles (phi,theta,psi) and angular rates (wx,wy,wz) together
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;

subplot(2,1,1)
plot(t, body.phi,   'r-',  'LineWidth', 2); hold on
plot(t, body.theta, 'g--', 'LineWidth', 2);
plot(t, body.psi,   'b-.', 'LineWidth', 2); hold off
l = legend('$$\phi(t)$$','$$\theta(t)$$','$$\psi(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('Angle [rad]','interpreter','latex','fontsize',20)
axis tight; grid minor

subplot(2,1,2)
plot(t, body.wx, 'r-',  'LineWidth', 2); hold on
plot(t, body.wy, 'g--', 'LineWidth', 2);
plot(t, body.wz, 'b-.', 'LineWidth', 2); hold off
l = legend('$$\omega_x(t)$$','$$\omega_y(t)$$','$$\omega_z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('$$\omega \,[{\rm rad/s}]$$','interpreter','latex','fontsize',20)
xlabel('$$t \,{\rm [s]}$$','interpreter','latex','fontsize',20)
axis tight; grid minor

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
