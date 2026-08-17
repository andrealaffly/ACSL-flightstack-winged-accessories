%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the desired user position, reference model 
% position, and the actual position of the UAV in a 3D trajectory plot.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2024 (Modified for 3D trajectory plot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = plotPositionActualReferenceUser3D(log, title_str)
    set(figure, 'Color', 'white');
    
    % Plot 3D trajectories
    plot3(log.x_user, log.y_user, log.z_user, 'r-.', 'LineWidth', 2);
    hold on;
    plot3(log.x_ref, log.y_ref, log.z_ref, 'b--', 'LineWidth', 2);
    plot3(log.x_m, log.y_m, log.z_m, 'k-', 'LineWidth', 2);
    hold off;
    
    % Legend and formatting
    l = legend('$$\mathbf{p}_{\rm cmd}(t)$$', '$$\mathbf{p}_{\rm ref}(t)$$', '$$\mathbf{p}(t)$$');
    set(l, 'interpreter', 'latex', 'fontsize', 15);
    
    xlabel('$$x \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    ylabel('$$y \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    zlabel('$$z \, {\rm [m]}$$', 'interpreter', 'latex', 'fontsize', 20);
    
    % Match the z-axis convention (reverse) from the original 2D script if needed for UAV NED frame
    ax = gca;
    ax.ZDir = 'reverse';
    
    grid minor;
    box on;
    axis tight;
    % view(3);
    
    title(title_str, 'Interpreter', 'latex', 'FontSize', 20);
end