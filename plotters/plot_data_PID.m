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
addpath("plotters/helpers/general/");
addpath("plotters/helpers/mocap/");
addpath("plotters/helpers/vio/");
addpath("plotters/helpers/mocap_vio/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 05/22/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot the translational command and states.
plotPosUser(log, 'PID - Translational Position');

%% Plot the translational velocity command and states.
plotVelUser(log, 'PID - Translational Velocity');

%% Plot the errors in the translational outer loop
plotTranslationalError(log, 'PID - Translational State Errors');

%% Integral Error in Position
plotTranslationalIntError(log, 'PID - Integral error in Position');

%% Translational outerloop virtual controls
plotOuterLoopVirtualControls(log, 'PID - Translational Virtual Forces');

%% Euler Angles
plotEulerUserAndAngle(log, 'PID - Euler Angles');

%% Euler Angles Rates
plotEulerRatesUserAndState(log, 'PID - Euler Rates');

%% Error in Angle and Angular Rates
plotErrAngleAngularRate(log, 'PID - Error In Euler Angle and Rates');

%% Integral Error in Euler Angles
plotEulerIntError(log, 'PID - Integral error in Euler Angles');

%% Rotational Inner loop controls
plotInnerLoopControls(log, 'PID - Rotational Control Moments');

%% Total Thrust in N
plotTotalThrustN(log, 'PID - Total Thrust in N');

%% Thrust Inputs for individual motors
plotMotorThrusts(log, 'PID - Individual Thrust Inputs');

%% Contribution of PID tran
plotOuterLoopBaselineContrib(log, der, 'PID - Translational Baseline Contributions');

%% Contribution of PID rot
plotInnerLoopBaselineContrib(log, der, 'PID - Rotational Baseline Contributions');

%% Total Execution Time 
plotTotalExecutionTime(log,der,'PID -Algorithm Execution Time');

%% Desired Euler Acceleration
plotDesiredEulerAcceleration(log, 'PID - Desired Euler Acceleration');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'PID - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'PID - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'PID - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'PID - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'PID - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'PID - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'PID - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'PID - Mocap and VIO Orientation');
