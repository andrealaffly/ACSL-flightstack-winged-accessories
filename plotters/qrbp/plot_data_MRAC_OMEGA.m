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
addpath("plotters/helpers/general/aerodynamics/");
addpath("plotters/helpers/mrac_omega/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 01/23/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% OUTERLOOP STUFF
% =========================================================================
%% Plot the translational command, reference and state
plotPosRefUser(log, 'MRAC - Translational Position');

%% Plot the translational velocity command, reference and state
plotVelRefUser(log, 'MRAC - Translational Velocity');

%% Plot User vs Ref Acceleration
plotUserRefAcceleration(log, 'MRAC - Translational Acceleration');

%% Plot translational errors in position and velocity
plotTranslationalError(log, 'MRAC - Translational Error');

%% Plot translational integral error in position 
plotTranslationalIntError(log, 'MRAC - Integral Error in Position');

%% Plot the reference model errors in the outer loop
plotRefModelErrTran(log, 'MRAC - Translational Reference Model Errors');

%% Plot the reference model r_cmd in the outer loop
plotTranslationalRCMD(log, 'MRAC - Translational R Cmd');

%% Translational outerloop virtual controls
plotOuterLoopVirtualControls(log, 'MRAC - OuterLoop Virtual Controls');

%% Plot baseline and Adaptive Control inputs
plotTranslationalBaselineAdaptiveU(log, 'MRAC - OutLoop Control Contributions');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Euler Angles
plotEulerUserAndAngle(log, 'MRAC - Euler Angles');

%% Plot the angular velocity command, reference and state
plotAngularVelocitiesUserRefState(log, 'MRAC - Angular Velocities');

%% Plot user vs ref angular acceleration
plotAngularUserRefAcceleration(log, 'MRAC - Angular Acceleration');

%% Plot the error in the Euler Angles and the Angular Velocities
plotErrAngleAngularVelocities(log, 'MRAC - Rotational Error');

%% Plot rotational integral error in Euler angles
plotEulerIntError(log, 'MRAC - Integral Euler Angle Error');

%% Plot the reference model errors in the inner loop
plotRefModelErrRot(log, 'MRAC - Rotational Reference Model Errors');

%% Plot reference model r_cmd in the inner loop
plotRotationalRCMD(log, 'MRAC - Rotational R Cmd');

%% Rotational innerloop virtual contols 
plotInnerLoopControls(log, 'MRAC - Rotational Control Moments');

%% Plot baseline and adaptive control inputs
plotRotationalBaselineAdaptiveU(log, 'MRAC - InnerLoop Control Contributions');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the total thrust
plotTotalThrustN(log, 'MRAC - Total Thrust');

%% Plot the individual motor thrusts
plotMotorThrusts(log, 'MRAC - Motor Thrusts');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE GAINS STUFF
% =========================================================================
%% Plot Deadzone value - Outer Loop
plotOuterloop_err_dz_op(log, der, 'MRAC - Outerloop DeadZone');

%% Plot K Hat X - Outer Loop
plotOLKx(log, der, 'MRAC - OL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Outer Loop
plotOLKr(log, der, 'MRAC - OL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Outer Loop
plotOLTheta(log, der, 'MRAC - OL $$\hat{\Theta}$$');

%% Plot Deadzone value - Inner Loop
plotInnerloop_err_dz_op(log, der, 'MRAC - Innerloop DeadZone');

%% Plot K Hat X - Inner Loop
plotILKx(log, der, 'MRAC - IL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Inner Loop
plotILKr(log, der, 'MRAC - IL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Inner Loop
plotILTheta(log, der, 'MRAC - IL $$\hat{\Theta}$$');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% TOTAL COMPUTE TIME
% =========================================================================
%% Plot the total compute time 
plotTotalExecutionTime(log, der, 'MRAC - Compute Load');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% AERODYNAMICS STUFF
% =========================================================================
%% Plot the coefficients of Lift, Drag and Moment
plotAeroCoeff(log,'MRAC - Estimated Aerodynamic Coefficients');

%% Plot the squared norm of the body velocities
plotSqNormVel(log, 'MRAC - Squared Norm of Body Velocities');

%% Plot the aerodynamic angles
plotAeroAngles(log, 'MRAC - Estimated Aerodynamic Angles');

%% Plot the estimated Aero Forces and Moments in the wind frame
plotAeroForcesMoments(log, 'MRAC - Estimated Aerodynamic Forces and Moments');

%% Plot the outerloop and inner loop dynamic inversion terms
plotAeroDynInv(log, 'MRAC - Aero Dynamic Inversion');

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
