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

addpath("plotters/quadm/helpers/nmpc_hybrid/");
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
%% Plot the translational command, reference and state
plotPositionActualReferenceUser(log, 'NMPC HYBRID - Translational Position');

%% Plot the translational velocity command, reference and state
plotVelocityActualReferenceUser(log, 'NMPC HYBRID - Translational Velocity');

%% Plot translational errors in position and velocity
plotTranslationalError(log, 'NMPC HYBRID - Translational Errors');

%% Plot the L2-norm of the outerloop errors
plotL2NormsTranslational(log, der, 'NMPC HYBRID - Translational L2 Norm');

%% Plot the reference model r_cmd in the outer loop
plotTranslationalReferenceCommand(log, 'NMPC HYBRID - Translational Reference Command');

%% Plot baseline, adaptive and total translational force
plotTranslationalForceBaselineAdaptiveTotal(log, 'NMPC HYBRID - Translational Outerloop Control');

%% Plot the filtered (command generator) force
plotFilteredForce(log, 'NMPC HYBRID - Filtered Force');

%% Plot the disturbance acceleration estimate
plotDisturbanceEstimate(log, 'NMPC HYBRID - Disturbance Estimate');

%% Plot the hybrid reset events
plotHybridResetEvents(log, 'NMPC HYBRID - Hybrid Reset Events');

%% Plot the outer NMPC solver diagnostics
plotOuterNMPCDiagnostics(log, 'NMPC HYBRID - Outer NMPC Diagnostics');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Euler angles against the desired attitude (from R_d)
plotAttitudeTrajEuler(log, der, 'NMPC HYBRID - Rotational Euler Angles');

%% Plot the angular velocity command, reference and state
plotAngularVelocityCommandReferenceState(log, 'NMPC HYBRID - Rotational Angular Velocity');

%% Plot the attitude error e_R
plotAttitudeError(log, 'NMPC HYBRID - Attitude Error');

%% Plot baseline, adaptive and total rotational torque
plotRotationalTorqueBaselineAdaptiveTotal(log, 'NMPC HYBRID - Rotational Innerloop Control');

%% Plot the inner NMPC solver diagnostics
plotInnerNMPCDiagnostics(log, 'NMPC HYBRID - Inner NMPC Diagnostics');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE ROBUSTIFICATION STUFF
% =========================================================================
%% Plot the dead-zone values and the projection activation flags
plotDeadZoneProjectionFlags(log, 'NMPC HYBRID - Dead Zone and Projection Flags');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the mixer inputs (thrust and moments)
plotControlInputs(log, 'NMPC HYBRID - Control Inputs');

%% Plot the individual motor thrusts
plotMotorThrust(log, 'NMPC HYBRID - Motor Thrust');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% TOTAL COMPUTE TIME
% =========================================================================
%% Plot the total compute time
plotAlgorithmExecutionTime(log, 'NMPC HYBRID - Algorithm Execution Time');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'NMPC HYBRID - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'NMPC HYBRID - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'NMPC HYBRID - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'NMPC HYBRID - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'NMPC HYBRID - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'NMPC HYBRID - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'NMPC HYBRID - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'NMPC HYBRID - Mocap and VIO Orientation');
