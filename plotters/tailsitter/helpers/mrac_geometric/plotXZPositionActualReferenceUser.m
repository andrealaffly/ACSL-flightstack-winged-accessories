%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user position, reference model 
% position, and the actual position of the UAV in the XZ plane.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024 (Modified for XZ 2D trajectory plot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = plotXZPositionActualReferenceUser(log, title_str)
    set(figure, 'Color', 'white');
    
    % Plot XZ trajectories
    plot(log.x_user, log.z_user, 'r-.', 'LineWidth', 2);
    hold on;
    plot(log.x_ref, log.z_ref, 'b--', 'LineWidth', 2);
    plot(log.x_m, log.z_m, 'k-', 'LineWidth', 2);
    hold off;
    
    % Legend and formatting
    l = legend('$$[x_{\rm cmd}(t), z_{\rm cmd}(t)]$$', '$$[x_{\rm ref}(t), z_{\rm ref}(t)]$$', '$$[x(t), z(t)]$$');
    set(l, 'interpreter', 'latex', 'fontsize', 15);
    
    xlabel('$$x \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    ylabel('$$z \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    
    % Match the z-axis convention (reverse) from the original script for UAV NED frame
    ax = gca;
    ax.YDir = 'reverse';
    
    grid minor;
    box on;
    axis tight;
    
    title(title_str, 'Interpreter', 'latex', 'FontSize', 20);
end