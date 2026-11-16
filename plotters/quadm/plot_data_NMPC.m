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

addpath("plotters/helpers/mocap/");
addpath("plotters/helpers/vio/");
addpath("plotters/helpers/mocap_vio/");

addpath("plotters/quadm/helpers/nmpc/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% OUTERLOOP STUFF
% =========================================================================
%% Plot the translational position command and state
plotPositionActualUser(log, 'NMPC - Translational Position');

%% Plot the translational velocity command and state
plotVelocityActualUser(log, 'NMPC - Translational Velocity');

%% Plot translational errors in position and velocity
plotTranslationalError(log, 'NMPC - Translational Errors');

%% Plot the translational integral error (feeds the disturbance estimate)
plotTranslationalIntError(log, 'NMPC - Translational Integral Error');

%% Plot the L2-norm of the outerloop errors
plotL2NormsTranslational(log, der, 'NMPC - Translational L2 Norm');

%% Plot the disturbance acceleration estimate
plotDisturbanceEstimate(log, 'NMPC - Disturbance Estimate');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Euler angles against the reference model (from R_ref)
plotAttitudeTrajEuler(log, der, 'NMPC - Rotational Euler Angles');

%% Plot the angular velocity against the reference model
plotAngularVelocityActualReference(log, 'NMPC - Rotational Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% NMPC SOLVER DIAGNOSTICS
% =========================================================================
%% Plot the cost, iterations, line search step and execution time
plotNMPCDiagnostics(log, 'NMPC - Solver Diagnostics');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the mixer inputs (thrust and moments)
plotControlInputs(log, 'NMPC - Control Inputs');

%% Plot the individual motor thrusts
plotMotorThrust(log, 'NMPC - Motor Thrust');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'NMPC - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'NMPC - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'NMPC - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'NMPC - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'NMPC - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'NMPC - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'NMPC - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'NMPC - Mocap and VIO Orientation');
