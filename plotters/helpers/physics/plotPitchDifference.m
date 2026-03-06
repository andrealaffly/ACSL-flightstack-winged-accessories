function [] = plotPitchDifference(body, title_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot difference between pitch angle and pitch_bp vs time (deg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(figure, 'Color', 'white')

t = body.t;
dtheta_deg = rad2deg(body.theta - body.theta_bp);

plot(t, dtheta_deg, 'k-', 'LineWidth', 2);
ylabel('$$\theta(t) - \theta_{\rm bp}(t)\, [{\rm deg}]$$', ...
       'interpreter','latex','fontsize',20)
xlabel('$$t \,[{\rm s}]$$','interpreter','latex','fontsize',20)
grid minor; axis tight

sgtitle(title_str,'Interpreter','latex','FontSize',20);

end
