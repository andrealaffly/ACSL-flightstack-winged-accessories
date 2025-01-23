function [] = processWorkspace(picked_platform, picked_controller, date)

% Properties of qrbp
G = 9.81;
MASS = 1.95056951; 
I_q = [0.03170556, -0.00000810,  0.00102548;
	  -0.00000810,  0.02125186, -0.00000107;
	   0.00102548, -0.00000107,  0.03765785];

I_b = [ 0.03676930,  0.00000339, -0.00005560;
        0.00000339,  0.01964797, -0.00000662;
       -0.00005560, -0.00000662,  0.03093953];

if (strcmp(picked_controller,'PID'))
    controller = 'PID/';
elseif (strcmp(picked_controller,'MRAC_PID'))
    controller = 'MRAC_PID/';
elseif (strcmp(picked_controller, 'PID_OMEGA'))
    controller = 'PID_OMEGA/';
elseif (strcmp(picked_controller, 'MRAC_OMEGA'))
    controller = 'MRAC_OMEGA/';
end

% Define the directory containing the flight logs
baseDir = fullfile(pwd, 'flight_log', picked_platform, date);

% Check if the directory exists
if ~isfolder(baseDir)
    error('The directory %s does not exist.', baseDir);
end

% Get a list of all items in the base directory
items = dir(baseDir);

% Initialize a cell array to store the names of the flight run subfolders
flightRunNames = {};

% Loop through each item in the directory
for i = 1:length(items)
    % Skip '.' and '..' directories
    if strcmp(items(i).name, '.') || strcmp(items(i).name, '..')
        continue;
    end
    % Check if the item is a folder and matches the flight_run_ pattern
    if items(i).isdir && startsWith(items(i).name, 'flight_run_')
        % Add the name of the subfolder to the list
        flightRunNames{end+1} = items(i).name; %#ok<SAGROW>
    end
end

% Display the names of the flight run subfolders
disp('Flight run subfolders:');
disp(flightRunNames);

if (strcmp(picked_controller,'PID'))
    process_pid_log(flightRunNames,baseDir,controller,MASS,I_q);
elseif (strcmp(picked_controller,'MRAC_PID'))
    process_mrac_pid_log(flightRunNames,baseDir,controller,MASS,I_q,I_b);
elseif (strcmp(picked_controller, 'PID_OMEGA'))
    process_pid_omega_log(flightRunNames,baseDir,controller,MASS,I_q);
elseif (strcmp(picked_controller, 'MRAC_OMEGA'))
    process_mrac_omega_log(flightRunNames,baseDir,controller,MASS,I_q);
end

% all the data after saving them so that we can load what we want and plot
% in plot_data.m
% clear all

end