function log = processGainMatrixLog(log, variableName, data, startIndex, rows, cols)
    % Validate the inputs
    if rows * cols + startIndex - 1 > size(data.data, 2)
        error('Insufficient columns in data.data for the specified rows and columns.');
    end

    % Loop through rows and columns to assign data
    for col = 0:cols-1
        for row = 0:rows-1
            fieldName = sprintf('ind%d_%d', row, col); % Generate the field name
            log.(variableName).(fieldName) = data.data(:, startIndex); % Assign the data
            startIndex = startIndex + 1; % Increment the index
        end
    end
end
