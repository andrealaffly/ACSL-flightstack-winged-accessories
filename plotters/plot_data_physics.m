%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot_data_physics.m
%
% Simple plotting of chassis and propeller physics data from physics_log_*.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all

set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaultAxesFontSize', 30);

% Add your helper path if needed
addpath('plotters/helpers/physics/');   % or wherever you store these fns

% -------------------------------------------------------------------------
% Load one physics_log_<run>.mat by double clicking in MATLAB, or:
% load('physics_log_flight_run_001.mat'); % contains struct 'physics'
% -------------------------------------------------------------------------

% Example assumes variable 'physics' is in workspace
%% Chassis Angles
plotAnglesAndBp(physics.chassis,        'Chassis: Angles and Body-Frame Angles');

%% Chassis Quaternions
plotQuaternions(physics.chassis,        'Chassis: Quaternions');

%% Biplane frame pitch difference
plotPitchDifference(physics.chassis,    'Chassis: Pitch Difference $$\theta - \theta_{\rm bp}$$');

%% Chassis Translational States
plotPosVelAcc(physics.chassis,          'Chassis: Position, Velocity, Acceleration');

%% Chassis Forces and Torques
plotForcesTorques(physics.chassis,      'Chassis: Forces and Torques');

%% Chassis Angular Rates NED frame expressed w.r.t to inertial NED frame
plotAngleAndOmega(physics.chassis,      'Chassis: Angles and Angular Rates');

%% Propeller 1
plotAnglesAndBp(physics.propeller_1,    'Propeller 1: Angles and Body-Frame Angles');
plotPosVelAcc(physics.propeller_1,      'Propeller 1: Position, Velocity, Acceleration');
plotForcesTorques(physics.propeller_1,  'Propeller 1: Forces and Torques');
plotAngleAndOmega(physics.propeller_1,  'Propeller 1: Angles and Angular Rates');
plotPitchDifference(physics.propeller_1,'Propeller 1: Pitch Difference $$\theta - \theta_{\rm bp}$$');

%% Propeller 2
plotAnglesAndBp(physics.propeller_2,    'Propeller 2: Angles and Body-Frame Angles');
plotPosVelAcc(physics.propeller_2,      'Propeller 2: Position, Velocity, Acceleration');
plotForcesTorques(physics.propeller_2,  'Propeller 2: Forces and Torques');
plotAngleAndOmega(physics.propeller_2,  'Propeller 2: Angles and Angular Rates');
plotPitchDifference(physics.propeller_2,'Propeller 2: Pitch Difference $$\theta - \theta_{\rm bp}$$');

%% Propeller 3
plotAnglesAndBp(physics.propeller_3,    'Propeller 3: Angles and Body-Frame Angles');
plotPosVelAcc(physics.propeller_3,      'Propeller 3: Position, Velocity, Acceleration');
plotForcesTorques(physics.propeller_3,  'Propeller 3: Forces and Torques');
plotAngleAndOmega(physics.propeller_3,  'Propeller 3: Angles and Angular Rates');
plotPitchDifference(physics.propeller_3,'Propeller 3: Pitch Difference $$\theta - \theta_{\rm bp}$$');

%% Propeller 4
plotAnglesAndBp(physics.propeller_4,    'Propeller 4: Angles and Body-Frame Angles');
plotPosVelAcc(physics.propeller_4,      'Propeller 4: Position, Velocity, Acceleration');
plotForcesTorques(physics.propeller_4,  'Propeller 4: Forces and Torques');
plotAngleAndOmega(physics.propeller_4,  'Propeller 4: Angles and Angular Rates');
plotPitchDifference(physics.propeller_4,'Propeller 4: Pitch Difference $$\theta - \theta_{\rm bp}$$');
