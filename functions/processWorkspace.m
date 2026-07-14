function [der, log] = processWorkspace(picked_platform, picked_controller, date, sim, log_file_name, use_most_recent_log)

if (strcmp(picked_platform, 'qrbp'))
    % Add the path to qrbp processors
    addpath("functions/qrbp/");

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

elseif (strcmp(picked_platform, 'tailsitter'))
    % Add the path to tailsitter processors
    addpath("functions/tailsitter/");
    
    % Properties of tailsitter
    properties.G = 9.81;

    properties.MASS = 1.63252801;

    properties.I_q = [0.15226711,-0.00048479, -0.00000929;
                     -0.00048479, 0.05253416,  0.00110234;
                     -0.00000929, 0.00110234,  0.18998386];

    properties.I_b = [0.18998386, -0.00110233,  0.00000929;
                     -0.00110233,  0.05253416, -0.00048479;
                      0.00000929, -0.00048479,  0.15226711];

    properties.RHO_HAT = 1.225;

    properties.LX = 0.2230099724;                                    % dist to motor along x^J         [m]
    properties.LY = 0.2589711696;                                    % dist to motor along y^J         [m]
    properties.LZ_S = 0.10234962;                                    % dist to aero center of stabs    [m]
    properties.SPAN_W = 1.50;                                        % span of wings                   [m]
    properties.CHORD_W = 0.2;                                        % chord of wings                  [m]
    properties.SPAN_S = 0.420;                                       % span of stabs                   [m]
    properties.CHORD_S = 0.05;                                       % chord of stabs                  [m]
    properties.PLANFORM_AREA_W = (2.0 * properties.SPAN_W * properties.CHORD_S);           % planform area of wings        [m^2]
    properties.PLANFORM_AREA_S = (2.0 * properties.SPAN_S * properties.CHORD_S);           % planform area of stabs        [m^2]
    
    % Aerodynamic Dynamic Coefficient Defines
    properties.DYN_PRESS_COEFF_W = (0.5 * properties.RHO_HAT * properties.PLANFORM_AREA_W);     
    properties.DYN_PRESS_COEFF_S = (0.5 * properties.RHO_HAT * properties.PLANFORM_AREA_S);

elseif (strcmp(picked_platform, 'quadm'))
    % Add the path to quadm processors
    addpath("functions/quadm/");

    % Properties of quadm
    properties.G = 9.81;

    properties.MASS = 1.05748;

    properties.I_q = [0.00356507620334993,  -4.08770048558901e-06, -8.65500570931156e-07;
                     -4.08770048558901e-06,   0.00408659486216925, -1.15603516031003e-05;
                     -8.65500570931156e-07, -1.15603516031003e-05,  0.00606507369923718];

    properties.RHO_HAT = 1.28;

end


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
elseif (strcmp(picked_controller, 'MRAC_LONG_LAT'))
    controller = 'MRAC_LONG_LAT/';
elseif (strcmp(picked_controller, 'PID_QUATERNION'))
    controller = 'PID_QUATERNION/';
elseif (strcmp(picked_controller, 'PID_GEOMETRIC'))
    controller = 'PID_GEOMETRIC';
elseif (strcmp(picked_controller, 'MRAC_GEOMETRIC'))
    controller = 'MRAC_GEOMETRIC';
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

% -------------------------------------------------------------------------
% If this is a simulation run, process physics.log 
% -------------------------------------------------------------------------
if sim
    % physics.log lives directly in each run folder under baseDir
    process_physics_log(flightRunNames, baseDir);
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
elseif (strcmp(picked_controller, 'MRAC_LONG_LAT'))
    process_mrac_long_lat_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'PID_QUATERNION'))
    process_pid_quaternion_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'PID_GEOMETRIC'))
    process_pid_geometric_log(flightRunNames,baseDir,controller,properties);
elseif (strcmp(picked_controller, 'MRAC_GEOMETRIC'))
    process_mrac_geometric_log(flightRunNames,baseDir,controller,properties);
end

% all the data after saving them so that we can load what we want and plot
% in plot_data.m
% clear all

% -------------------------------------------------------------------------
% Load a processed flight-run log into the workspace on request.
%
% If use_most_recent_log is true, the most recently modified
% 'flight_run_*' subfolder under baseDir is used, regardless of the name
% passed in log_file_name.
%
% If use_most_recent_log is false, the subfolder named exactly
% log_file_name is used instead.
%
% Either way, the single .mat file inside that subfolder (e.g.
% 'MRAC_GEOMETRIC_log_flight_run_19_05_13.mat') is loaded and returned
% in 'der'. This runs after processing above, so a freshly-processed run
% can be loaded immediately without a second call.
% -------------------------------------------------------------------------
der = [];
log = [];
if nargin >= 6 && ~isempty(use_most_recent_log)
    % Gather ALL flight_run_ subfolders (processed or not) so we can pick
    % from runs that already have a saved .mat, not just newly-processed ones
    allItems = dir(baseDir);
    allRunNames = {};
    allRunDatenums = [];
    for i = 1:length(allItems)
        if allItems(i).isdir && startsWith(allItems(i).name, 'flight_run_')
            allRunNames{end+1} = allItems(i).name; %#ok<AGROW>
            allRunDatenums(end+1) = allItems(i).datenum; %#ok<AGROW>
        end
    end

    if isempty(allRunNames)
        error('No flight_run_ subfolders found in %s.', baseDir);
    end

    if use_most_recent_log
        % Pick the subfolder with the latest modification time
        [~, idx] = max(allRunDatenums);
        runName = allRunNames{idx};
    else
        if nargin < 5 || isempty(log_file_name)
            error('log_file_name must be provided when use_most_recent_log is false.');
        end
        if ~ismember(log_file_name, allRunNames)
            error('Flight run "%s" was not found in %s.', log_file_name, baseDir);
        end
        runName = log_file_name;
    end

    runFolder = fullfile(baseDir, runName);
    matFiles = dir(fullfile(runFolder, '*.mat'));

    if isempty(matFiles)
        error(['No processed .mat file found in %s.\n', ...
            'Run processing first (call without use_most_recent_log, ', ...
            'or ensure this run has already been processed).'], runFolder);
    % elseif numel(matFiles) > 1
    %     warning('Multiple .mat files found in %s; loading the first one: %s', ...
    %         runFolder, matFiles(1).name);
    end

    matFilePath = fullfile(runFolder, matFiles(1).name);
    fprintf('Loading processed log: %s\n', matFilePath);
    temp = load(matFilePath);
    log = temp.log;
    der = temp.der;
end

end