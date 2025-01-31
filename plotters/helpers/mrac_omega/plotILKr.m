%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is used to plot the Inner loop K hat R gains along with the 
% projection operator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/31/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = plotILKr(log,der, title)

% Extract the numbers in the indices using regular expressions
fields = fieldnames(log.K_hat_r_rot);
indices = cellfun(@(x) regexp(x, '\d+','match'), fields, 'UniformOutput', false);

% Convert to numerical format
n = cellfun(@(x) str2double(x{1}), indices);
m = cellfun(@(x) str2double(x{2}), indices);

% Make a vector of all the row and column numbers
n_ind = min(n):1:max(n);
m_ind = min(m):1:max(m);

% Initialize the array for indices
l = {};

% Loop through and create plots
for i = (1:length(m_ind))
    mm = m_ind(i);

    l = {};     % Reset the legend array
    
    t = strcat(title, sprintf(' Column %d', mm + 1)); % Concatenate using strcat
    
    % Start a figure
    set(figure,'Color','White')
    
    hold on

    % plot the upper and lower bound of the projection operator
    yline(der.inner_loop.projection_operator.up_bound.r, 'r--', 'LineWidth',2);
    yline(der.inner_loop.projection_operator.lw_bound.r, 'b-.', 'LineWidth',2);
    yline(-der.inner_loop.projection_operator.up_bound.r, 'r--', 'LineWidth',2);
    yline(-der.inner_loop.projection_operator.lw_bound.r, 'b-.', 'LineWidth',2);


    % Add to the legend
    l{end+1} = sprintf('UB - $$\\sqrt{x_{\\rm max} + \\epsilon}$$');
    l{end+1} = sprintf('LB - $$\\sqrt{x_{\\rm max}}$$');
    l{end+1} = '';
    l{end+1} = '';

    for j = (1:length(n_ind))
        nn = n_ind(j);
        
        fieldName = sprintf('ind%d_%d', nn, mm); % Generate the field name
        
        gains = log.K_hat_r_rot.(fieldName);     % Extract the data
        
        % Store the index in the legend
        % Format the legend string and append it to the array
        l{end+1} = sprintf('$$\\rm ind_{%d,%d}$$', nn+1, mm+1);

        plot(log.Controller_Time_s,gains,'LineWidth',1.5);

    end

    % Get the y-axis limits
    yLimits = ylim;  % Get the current y-axis limits

    % Add semi-transparent vertical rectangles where projection operator is activated
    proj_op_activated = log.proj_op_activated.inner_loop.K_hat_r;  % Boolean vector
    time = log.Controller_Time_s;
    
    % Find intervals where projection operator is activated
    activated_intervals = findProjectionOperatorActivationIntervals(proj_op_activated, time);

    % Plot the patches for each interval
    for k = 1:size(activated_intervals, 1)
        x_start = activated_intervals(k, 1);
        x_end = activated_intervals(k, 2);

        % Create patch for the interval
        patch([x_start, x_end, x_end, x_start], ...
          [yLimits(1), yLimits(1), yLimits(2), yLimits(2)], ...
          'g', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
    end

    hold off
    
    % Add one legend more for projection if the projection is activated
    if ~isempty(activated_intervals)
        l{end+1} = 'Proj. Op. Activated';
    end

    % Set the legend and other plot settings
    hLegend = legend(l);
    set(hLegend, 'Interpreter', 'latex', 'FontSize', 10, 'Location', 'bestoutside');  % Set the properties


    ylabel('[-]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',30)
    sgtitle(t,'Interpreter','latex','FontSize',20);
end

end