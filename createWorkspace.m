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
% Specify the date in YYYY_MM_DD
date = "2025_01_31";

% Uncomment the platform - Should match the flightstack
picked_platform = "qrbp";
% picked_platform = "rostestdrone";

% Uncomment the controller - Should match the flightstack
% picked_controller = 'PID';
% picked_controller = 'MRAC_PID';
% picked_controller = 'PID_OMEGA';
picked_controller = 'MRAC_OMEGA';

%==========================================================%

% Process all the data and create workspaces for the specified date and
% controller.
processWorkspace(picked_platform, picked_controller, date)

