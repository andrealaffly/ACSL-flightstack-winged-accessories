function [] = plotPosVelAcc(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot position, velocity, acceleration vs time (x,y,z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;

subplot(3,1,1)
plot(t, body.x,  'r-', 'LineWidth', 2); hold on
plot(t, body.y,  'g--','LineWidth', 2);
plot(t, body.z,  'b-.','LineWidth', 2); hold off
l = legend('$$x(t)$$','$$y(t)$$','$$z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('pos [m]','interpreter','latex','fontsize',20)
axis tight; grid minor

subplot(3,1,2)
plot(t, body.vx, 'r-', 'LineWidth', 2); hold on
plot(t, body.vy, 'g--','LineWidth', 2);
plot(t, body.vz, 'b-.','LineWidth', 2); hold off
l = legend('$$v_x(t)$$','$$v_y(t)$$','$$v_z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('vel [m/s]','interpreter','latex','fontsize',20)
axis tight; grid minor

subplot(3,1,3)
plot(t, body.ax, 'r-', 'LineWidth', 2); hold on
plot(t, body.ay, 'g--','LineWidth', 2);
plot(t, body.az, 'b-.','LineWidth', 2); hold off
l = legend('$$a_x(t)$$','$$a_y(t)$$','$$a_z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('acc [m/s^2]','interpreter','latex','fontsize',20)
xlabel('$$t \,{\rm [s]}$$','interpreter','latex','fontsize',20)
axis tight; grid minor

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
