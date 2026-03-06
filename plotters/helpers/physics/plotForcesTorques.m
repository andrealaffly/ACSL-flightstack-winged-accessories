function [] = plotForcesTorques(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot interaction forces (muI, muJ) and torques (tauJ) side by side
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;

% Left: forces
subplot(1,2,1)
plot(t, body.muIx, 'r-',  'LineWidth', 2); hold on
plot(t, body.muIy, 'g--', 'LineWidth', 2);
plot(t, body.muIz, 'b-.', 'LineWidth', 2);
plot(t, body.muJx, 'c-',  'LineWidth', 1.5);
plot(t, body.muJy, 'm--', 'LineWidth', 1.5);
plot(t, body.muJz, 'k-.', 'LineWidth', 1.5); hold off
l = legend('$$\mu_{Ix}$$','$$\mu_{Iy}$$','$$\mu_{Iz}$$', ...
           '$$\mu_{Jx}$$','$$\mu_{Jy}$$','$$\mu_{Jz}$$');
set(l,'interpreter','latex','fontsize',15);
xlabel('$$t \,{\rm [s]}$$','interpreter','latex','fontsize',20)
ylabel('Force [N]','interpreter','latex','fontsize',20)
axis tight; grid minor

% Right: torques
subplot(1,2,2)
plot(t, body.tauJx, 'r-',  'LineWidth', 2); hold on
plot(t, body.tauJy, 'g--', 'LineWidth', 2);
plot(t, body.tauJz, 'b-.', 'LineWidth', 2); hold off
l = legend('$$\tau_{Jx}$$','$$\tau_{Jy}$$','$$\tau_{Jz}$$');
set(l,'interpreter','latex','fontsize',15);
xlabel('$$t \,{\rm [s]}$$','interpreter','latex','fontsize',20)
ylabel('Torque [N\,m]','interpreter','latex','fontsize',20)
axis tight; grid minor

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
