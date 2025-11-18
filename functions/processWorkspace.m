function [] = processWorkspace(picked_platform, picked_controller, date, sim)

% Properties of qrbp
properties.G = 9.81;

properties.MASS = 1.68817748; 

properties.I_q = [0.02353227, -0.00000011,  0.00047910;
                 -0.00000011,  0.01623841, -0.00000128;
                  0.00047910, -0.00000128,  0.02753728];

properties.I_b = [ 0.02753728,  0.00000128, -0.00047910;
                   0.00000128,  0.01623841, -0.00000011;
                  -0.00047910, -0.00000011,  0.02353227];

properties.RHO_HAT = 1.225;

properties.LX = 0.097509;                                        % dist to motor along x^J         [m]
properties.LY = 0.110688;                                        % dist to motor along y^J         [m]
properties.LZ_S = 0.038779;                                      % dist to aero center of stabs    [m]
properties.SPAN_W = 0.50;                                        % span of wings                   [m]
properties.CHORD_W = 0.12;                                       % chord of wings                  [m]
properties.SPAN_S = 0.175;                                       % span of stabs                   [m]
properties.CHORD_S = 0.02;                                       % chord of stabs                  [m]
properties.PLANFORM_AREA_W = (2.0 * properties.SPAN_W * properties.CHORD_S);           % planform area of wings        [m^2]
properties.PLANFORM_AREA_S = (2.0 * properties.SPAN_S * properties.CHORD_S);           % planform area of stabs        [m^2]

% Aerodynamic Dynamic Coefficient Defines
properties.DYN_PRESS_COEFF_W = (0.5 * properties.RHO_HAT * properties.PLANFORM_AREA_W);     
properties.DYN_PRESS_COEFF_S = (0.5 * properties.RHO_HAT * properties.PLANFORM_AREA_S);


% Logic for which controller is picked
if (strcmp(picked_controller,'PID'))
    controller = 'PID/';
elseif (strcmp(picked_controller,'MRAC_PID'))
    controller = 'MRAC_PID/';
elseif (strcmp(picked_controller, 'PID_OMEGA'))
    controller = 'PID_OMEGA/';
elseif (strcmp(picked_controller, 'MRAC_OMEGA'))
    controller = 'MRAC_OMEGA/';
elseif (strcmp(picked_controller, 'MRAC_HYBRID'))
    controller = 'MRAC_HYBRID/';
elseif (strcmp(picked_controller, 'MRAC_OBSERVER'))
    controller = 'MRAC_OBSERVER/';
end

% Define the directory containing the flight logs
% IF it is flightstack mode, it reads the logs in the parent flight_log
% folder.
% ELSE it is in simulation mode, it reads the logs in the root folder of
% the codebase from 'sim-log'
if (~sim)
    baseDir = fullfile(pwd, 'flight_log', picked_platform, date);
else
    baseDir = fullfile(pwd, 'sim-log', picked_platform, date);
end

% Check if the directory exists
if ~isfolder(baseDir)
    error('The directory %s does not exist.', baseDir);
end

% Get a list of all items in the base directory
items = dir(baseDir);

% Initialize a cell array to store the names of the flight run subfolders
flightRunNames = {};

% % Loop through each item in the directory - Does not check for previously
% % processed flight-runs and skips them
% for i = 1:length(items)
%     % Skip '.' and '..' directories
%     if strcmp(items(i).name, '.') || strcmp(items(i).name, '..')
%         continue;
%     end
%     % Check if the item is a folder and matches the flight_run_ pattern
%     if items(i).isdir && startsWith(items(i).name, 'flight_run_')
%         % Add the name of the subfolder to the list
%         flightRunNames{end+1} = items(i).name; %#ok<SAGROW>
%     end
% end

% Loop through each item in the directory
for i = 1:length(items)
    % Skip '.' and '..' directories
    if strcmp(items(i).name, '.') || strcmp(items(i).name, '..')
        continue;
    end
    % Check if the item is a folder and matches the flight_run_ pattern
    if items(i).isdir && startsWith(items(i).name, 'flight_run_')
        folderPath = fullfile(items(i).folder, items(i).name);
        matFiles = dir(fullfile(folderPath, '*.mat'));
        if ~isempty(matFiles)
            fprintf('Flight run "%s" is already processed (MAT file present).\n', items(i).name);
        else
            flightRunNames{end+1} = items(i).name; %#ok<SAGROW>
        end
    end
end


% Display the names of the flight run subfolders
disp('Flight run subfolders:');
disp(flightRunNames);

% Logic for calling the right function to process the data
if (strcmp(picked_controller,'PID'))
    process_pid_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller,'MRAC_PID'))
    process_mrac_pid_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'PID_OMEGA'))
    process_pid_omega_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'MRAC_OMEGA'))
    process_mrac_omega_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'MRAC_HYBRID'))
    process_mrac_hybrid_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'MRAC_OBSERVER'))
    process_mrac_observer_log(flightRunNames,baseDir,controller,properties);
end

% all the data after saving them so that we can load what we want and plot
% in plot_data.m
% clear all

end