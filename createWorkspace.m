%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code is parses the flight_log folder and extracts all the flight
% runs and saves the data as workspaces.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Suppress some messages for brackets and other coding errors that is
% annoying - giri
%#ok<*NBRAK2>
%#ok<*CLALL>
clear all 
close all
clc
addpath("functions/");
addpath("functions/helpers/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 05/22/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==================== INPUT PARAMETERS ====================%
% Specify if the simulator is used or flightstack
% Set true for simulator mode
acsl_sim_mode = true;

% Specify the date in YYYY_MM_DD
date = "2026_05_15";

% Uncomment the platform - Should match the flightstack
% picked_platform = "qrbp";
picked_platform = "tailsitter";

% Uncomment the controller - Should match the flightstack
% Uncomment the controller for the qrbp
% picked_controller = 'PID';
% picked_controller = 'MRAC_PID';
% picked_controller = 'PID_OMEGA';
% picked_controller = 'MRAC_OMEGA';
% picked_controller = 'MRAC_HYBRID';
% picked_controller = 'MRAC_OBSERVER';
% picked_controller = 'MRAC_LONG_LAT';
% picked_controller = 'PID_QUATERNION';
% picked_controller = 'PID_GEOMETRIC';
% picked_controller = 'MRAC_GEOMETRIC';

% Uncomment the controller for the tailsitter
picked_controller = 'MRAC_GEOMETRIC';


%==========================================================%

% Process all the data and create workspaces for the specified date and
% controller.
processWorkspace(picked_platform, picked_controller, date, acsl_sim_mode)

