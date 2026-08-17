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

addpath("plotters/tailsitter/helpers/mrac_geometric/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 04/15/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% OUTERLOOP STUFF
% =========================================================================
%% Plot the translational command, reference and state
plotPositionActualReferenceUser(log, 'MRAC GEOMETRIC - Translational Position');

%% Plot the translational command, reference and state in 3D
plotPositionActualReferenceUser3D(log, 'MRAC GEOMETRIC - 3D trajectory');

%% Plot the translational command, reference and state in XY Plane  
plotXYPositionActualReferenceUser(log, 'MRAC GEOMETRIC - XY Plane');

%% Plot the translational command, reference and state in XZ Plane  
plotXZPositionActualReferenceUser(log, 'MRAC GEOMETRIC - XZ Plane');
    
%% Plot the translational velocity command, reference and state
plotVelocityActualReferenceUser(log, 'MRAC GEOMETRIC - Translational Velocity');

%% Plot User vs Ref Acceleration
plotAccelerationUserReference(log, 'MRAC GEOMETRIC - Translational Acceleration');

%% Plot translational errors in position and velocity
plotPositionVelocityError(log, 'MRAC GEOMETRIC - Translational Errors');

%% Plot the L2-norm of the outerloop errors
plotL2NormsTranslational(log, der, 'MRAC GEOMETRIC - Translational L2 Norm');

%% Plot the reference model errors in the outer loop
plotTranslationalReferenceModelError(log, 'MRAC GEOMETRIC - Translational Reference Model Errors');

%% Plot the reference model r_cmd in the outer loop
plotTranslationalReferenceCommand(log, 'MRAC GEOMETRIC - Translational Reference Command');

%% Plot baseline and Adaptive Control inputs
plotTranslationalVirtualControl(log, 'MRAC GEOMETRIC - Translational Outerloop Control');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Quaternions
plotQuaternionActualDesired(log, der, 'MRAC GEOMETRIC - Rotational Quaternion States');

%% Plot the angular velocity command, reference and state
plotAngularVelocityCommandReferenceState(log, 'MRAC GEOMETRIC - Rotational Angular Velocity');

%% Plot user vs ref angular acceleration
plotAngularAccelerationUserReference(log,  'MRAC GEOMETRIC - Rotational Angular Acceleration');

%% Plot the error in the Euler Angles and the Angular Velocities


%% Plot rotational integral error in Euler angles


%% Plot the reference model errors in the inner loop


%% Plot reference model r_cmd in the inner loop


%% Rotational innerloop virtual contols 
plotRotationalVirtualControl(log, 'MRAC GEOMETRIC - Rotational Innerloop Control');

%% Plot baseline and adaptive control inputs


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the total thrust
plotTotalThrust(log, 'MRAC GEOMETRIC - Thrust');

%% Plot the individual motor thrusts
plotMotorThrust(log, 'MRAC GEOMETRIC - Motor Thrust');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE GAINS STUFF
% =========================================================================
%% Plot Deadzone value - Outer Loop


%% Plot K Hat X - Outer Loop


%% Plot K Hat R - Outer Loop


%% Plot Theta Hat - Outer Loop


%% Plot Deadzone value - Inner Loop


%% Plot K Hat X - Inner Loop


%% Plot K Hat R - Inner Loop


%% Plot Theta Hat - Inner Loop


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% TOTAL COMPUTE TIME
% =========================================================================
%% Plot the total compute time 


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% AERODYNAMICS STUFF
% =========================================================================
%% Plot the coefficients of Lift, Drag and Moment


%% Plot the squared norm of the body velocities


%% Plot the aerodynamic angles


%% Plot the estimated Aero Forces and Moments in the wind frame


%% Plot the outerloop and inner loop dynamic inversion terms


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'MRAC - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'MRAC - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'MRAC - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'MRAC - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'MRAC - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'MRAC - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'MRAC - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'MRAC - Mocap and VIO Orientation');
