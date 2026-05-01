function [] = plotQuaternions(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot quaternions for quadcopter frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;

subplot(4,1,1)
plot(t, body.q0,    'r-',  'LineWidth', 2);
l = legend('$$q_0(t)$$');
set(l,'interpreter','latex','fontsize',15);
axis tight; grid minor

subplot(4,1,2)
plot(t, body.q1,    'r-',  'LineWidth', 2);
l = legend('$$q_1(t)$$');
set(l,'interpreter','latex','fontsize',15);
axis tight; grid minor

subplot(4,1,3)
plot(t, body.q2,    'r-',  'LineWidth', 2);
l = legend('$$q_2(t)$$');
set(l,'interpreter','latex','fontsize',15);
axis tight; grid minor

subplot(4,1,4)
plot(t, body.q3,    'r-',  'LineWidth', 2);
l = legend('$$q_2(t)$$');
set(l,'interpreter','latex','fontsize',15);
xlabel('$$t \,[{\rm s}]$$','interpreter','latex','fontsize',20)
axis tight; grid minor

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
