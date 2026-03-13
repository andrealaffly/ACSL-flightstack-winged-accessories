%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code used to plot the data saved in createWorkspace.m. Just pick the
% data you want to plot and then plot it. You can double click on the .mat
% file in the respective flight_run_ folders.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Suppress some messages for brackets and other coding errors that is
% annoying - giri
%#ok<*NBRAK2>
%#ok<*CLALL>
close all
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaultAxesFontSize', 30); 
addpath("plotters/helpers/pid_quaternion");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 03/10/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% OUTERLOOP STUFF
% =========================================================================
%% Plot the translational user vs position
plotPosTraj(log,  'QPID - Translational Position');

%% Plot the translational user vs velocity
plotVelTraj(log, 'QPID - Translational Velocity');

%% Plot the translational errors and integral errors
plotTranErrors(log, 'QPID - Translational Errors');

%% Plot the translational virtual control action
plotTranControl(log, 'QPID - Translational Virtual Control Action');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% DESIRED QUATERNION COMPUATION STUFF
% =========================================================================
%% Plot the desired thrust axis and the thrust setpoing
plotDesiredAxisAndThrust(log, der, 'QPID - Thrust Axis and Total Thrust');

%% Plot the alignment quaternion
plotAlignmentQuaternion(log, 'QPID - Alignment quaternion');

%% Plot the desired yaw quaternion
plotDesiredYawQuaternion(log, 'QPID - Desired yaw quatenrion');

%% Plot the differentiated quaternion 
plotQdotsignalQdotd(log, 'QPID - Desired quaternion rate');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot desired quaternion vs quaternion
plotAttitudeTraj(log, 'QPID - Orientation'); 

%% Plot desired euler vs euler
plotAttitudeTrajEuler(log, der, 'QPID - Euler Orientation');

%% Plot desired angular velocity vs angluar velocity
plotAngularVelocityTraj(log, 'QPID - Angular Velocity'); 

%% Plot the error quaternion and angular velocity
plotRotErrors(log, 'QPID - Error Quaternion and Angular Velocity');

%% Plot desired angular acceleration
plotDesiredAngularAcc(log, 'QPID - Desired Angular Acceleration');

%% Plot the rotational control input
plotTau(log, 'QPID - Rotational Control Input');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% plot the thrust per motor in N and the satruated normalized thrust
plotMotorControl(log, 'QPID - Motor Thrusts');