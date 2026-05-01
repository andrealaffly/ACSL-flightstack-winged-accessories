function [] = quad_biplane_plotter(bools, time, value)

% Iterate through the boolean array and fill sections with different colors
startIndex = 1;
for i = 2:length(bools)
    if bools(i) ~= bools(i-1) || i == length(bools)
        % Define the vertices for the fill patch
        x = [time(startIndex) time(i-1) time(i-1) time(startIndex)];
        
        if (min(value)~=max(value))
            y = [min(value) min(value) max(value) max(value)];
        else
            y = [-1 -1 1 1];
        end
        
        % Select color based on the boolean value
        if bools(startIndex) == 0
            fill(x, y, 'y', 'EdgeColor', 'none', 'FaceAlpha', 0.1); % Blue for 0 with 10% transparency
        else
            fill(x, y, 'g', 'EdgeColor', 'none', 'FaceAlpha', 0.1); % Red for 1 with 10% transparency
        end
        
        % Update startIndex
        startIndex = i;
    end
end


end