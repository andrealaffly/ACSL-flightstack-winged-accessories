
function plot_event_lines(t, event_vec, label_text, line_color)
%PLOT_EVENT_LINES Plots vertical lines at specified time events
%   t          : time vector
%   event_vec  : logical vector (same length as t), true where event occurs
%   label_text : text label to show at each event
%   line_color : line color and style (e.g., 'k--', 'r:', etc.)

    hold on;
    for i = 1:length(t)
        if event_vec(i)
            x = t(i);
            % Plot the vertical line (invisible to legend)
            xline(x, line_color, 'HandleVisibility', 'off');
            
            % Add text label (also invisible to legend)
            text(x, 0.5, label_text, ...
                'Rotation', 90, ...
                'VerticalAlignment', 'bottom', ...
                'HorizontalAlignment', 'center', ...
                'FontSize', 8, ...
                'HandleVisibility', 'off');
        end
    end
    hold off;
end
