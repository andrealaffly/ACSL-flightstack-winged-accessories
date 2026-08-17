%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user position, reference model 
% position, and the actual position of the UAV in the XY plane.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024 (Modified for XY 2D trajectory plot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = plotXYPositionActualReferenceUser(log, title_str)
    set(figure, 'Color', 'white');
    
    % Plot XY trajectories
    plot(log.x_user, log.y_user, 'r-.', 'LineWidth', 2);
    hold on;
    plot(log.x_ref, log.y_ref, 'b--', 'LineWidth', 2);
    plot(log.x_m, log.y_m, 'k-', 'LineWidth', 2);
    hold off;
    
    % Legend and formatting
    l = legend('$$[x_{\rm cmd}(t), y_{\rm cmd}(t)]$$', '$$[x_{\rm ref}(t), y_{\rm ref}(t)]$$', '$$[x(t), y(t)]$$');
    set(l, 'interpreter', 'latex', 'fontsize', 15);
    
    xlabel('$$x \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    ylabel('$$y \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    
    grid minor;
    box on;
    axis tight;
    
    title(title_str, 'Interpreter', 'latex', 'FontSize', 20);
end