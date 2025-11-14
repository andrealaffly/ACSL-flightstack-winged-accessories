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
addpath("plotters/helpers/mrac_observer/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 11/13/2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% OUTERLOOP STUFF
% =========================================================================
%% Plot the translational command, reference and state
plotPosRefUser(log, 'ADP OBS - Translational Position');

%% Plot the translational velocity command, reference and state
plotVelRefUser(log, 'ADP OBS - Translational Velocity');

%% Plot User vs Ref Acceleration
plotUserRefAcceleration(log, 'ADP OBS - Translational Acceleration');

%% Plot translational errors in position and velocity
plotTranslationalError(log, 'ADP OBS - Translational Error');

%% Plot translational integral error in position 
plotTranslationalIntError(log, 'ADP OBS - Integral Error in Position');

%% Plot the reference model errors in the outer loop
plotRefModelErrTran(log, 'ADP OBS - Translational Reference Model Errors');

%% Plot the reference model r_cmd in the outer loop
plotTranslationalRCMD(log, 'ADP OBS - Translational R Cmd');

%% Translational outerloop virtual controls
plotOuterLoopVirtualControls(log, 'ADP OBS - OuterLoop Virtual Controls');

%% Plot baseline and Adaptive Control inputs
plotTranslationalBaselineAdaptiveU(log, 'ADP OBS - OutLoop Control Contributions');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Euler Angles
plotEulerUserAndAngle(log, 'ADP OBS - Euler Angles');

%% Plot the angular velocity command, reference and state
plotAngularVelocitiesUserRefState(log, 'ADP OBS - Angular Velocities');

%% Plot user vs ref angular acceleration
plotAngularUserRefAcceleration(log, 'ADP OBS - Angular Acceleration');

%% Plot the error in the Euler Angles and the Angular Velocities
plotErrAngleAngularVelocities(log, 'ADP OBS - Rotational Error');

%% Plot rotational integral error in Euler angles
plotEulerIntError(log, 'ADP OBS - Integral Euler Angle Error');

%% Plot the reference model errors in the inner loop
plotRefModelErrRot(log, 'ADP OBS - Rotational Reference Model Errors');

%% Plot reference model r_cmd in the inner loop
plotRotationalRCMD(log, 'ADP OBS - Rotational R Cmd');

%% Rotational innerloop virtual contols 
plotInnerLoopControls(log, 'ADP OBS - Rotational Control Moments');

%% Plot baseline and adaptive control inputs
plotRotationalBaselineAdaptiveU(log, 'ADP OBS - InnerLoop Control Contributions');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the total thrust
plotTotalThrustN(log, 'ADP OBS - Total Thrust');

%% Plot the individual motor thrusts
plotMotorThrusts(log, 'ADP OBS - Motor Thrusts');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE GAINS STUFF
% =========================================================================
%% Plot Deadzone value - Outer Loop
plotOuterloop_err_dz_op(log, der, 'ADP OBS - Outerloop DeadZone');

%% Plot K Hat X - Outer Loop
plotOLKx(log, der, 'ADP OBS - OL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Outer Loop
plotOLKr(log, der, 'ADP OBS - OL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Outer Loop
plotOLTheta(log, der, 'ADP OBS - OL $$\hat{\Theta}$$');

%% Plot Deadzone value - Inner Loop
plotInnerloop_err_dz_op(log, der, 'ADP OBS - Innerloop DeadZone');

%% Plot K Hat X - Inner Loop
plotILKx(log, der, 'ADP OBS - IL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Inner Loop
plotILKr(log, der, 'ADP OBS - IL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Inner Loop
plotILTheta(log, der, 'ADP OBS - IL $$\hat{\Theta}$$');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% TOTAL COMPUTE TIME
% =========================================================================
%% Plot the total compute time 
plotTotalExecutionTime(log, der, 'ADP OBS - Compute Load');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% AERODYNAMICS STUFF
% =========================================================================
%% Plot the coefficients of Lift, Drag and Moment
plotAeroCoeff(log,'ADP OBS - Estimated Aerodynamic Coefficients');

%% Plot the squared norm of the body velocities
plotSqNormVel(log, 'ADP OBS - Squared Norm of Body Velocities');

%% Plot the aerodynamic angles
plotAeroAngles(log, 'ADP OBS - Estimated Aerodynamic Angles');

%% Plot the estimated Aero Forces and Moments in the wind frame
plotAeroForcesMoments(log, 'ADP OBS - Estimated Aerodynamic Forces and Moments');

%% Plot the outerloop and inner loop dynamic inversion terms
plotAeroDynInv(log, 'ADP OBS - Aero Dynamic Inversion');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE OBSERVER STUFF
% =========================================================================
%% Plot the estimated output (y_est) vs the measured output (y_output)
plotOLEstVsMeasuredOutput(log, 'ADP OBS - OL Estimated vs Measured Output');

%% Plot the estimated states (x_hat) vs the actual states (x)
plotOLEstVsMeasuredStates(log, 'ADP OBS - OL Estimated vs Measured States');

%% Plot the estimation error
plotOLEstError(log, 'ADP OBS - OL Estimation Error');

%% Plot the L2 Norm of the estimation error
plotOLEstErrorL2Norm(log, 'ADP OBS - OL Estimation Error L2 Norm');

%% Plot the Gains for the outerloop observer K_hat_y 
plotOLObsKy(log, der, 'ADP OBS - OL $$\hat{K}_{\rm y, observer}$$');

%% Plot the Gains for the outerloop observer Theta_hat_y
plotOLObsThetay(log, der, 'ADP OBS - OL $$\hat{\Theta}_{\rm y, observer}$$');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'ADP OBS - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'ADP OBS - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'ADP OBS - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'ADP OBS - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'ADP OBS - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'ADP OBS - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'ADP OBS - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'ADP OBS - Mocap and VIO Orientation');
