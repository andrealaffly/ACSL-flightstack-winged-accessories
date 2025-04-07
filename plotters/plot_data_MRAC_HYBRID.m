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
addpath("plotters/helpers/mrac_hybrid/");
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
plotPosRefUser(log, 'HYBRID - Translational Position');

%% Plot the translational velocity command, reference and state
plotVelRefUser(log, 'HYBRID - Translational Velocity');

%% Plot User vs Ref Acceleration
plotUserRefAcceleration(log, 'HYBRID - Translational Acceleration');

%% Plot translational errors in position and velocity
plotTranslationalError(log, 'HYBRID - Translational Error');

%% Plot translational integral error in position 
plotTranslationalIntError(log, 'HYBRID - Integral Error in Position');

%% Plot the reference model errors in the outer loop
plotRefModelErrTran(log, 'HYBRID - Translational Reference Model Errors');

%% Plot the reference model r_cmd in the outer loop
plotTranslationalRCMD(log, 'HYBRID - Translational R Cmd');

%% Translational outerloop virtual controls
plotOuterLoopVirtualControls(log, 'HYBRID - OuterLoop Virtual Controls');

%% Plot baseline and Adaptive Control inputs
plotTranslationalBaselineAdaptiveU(log, 'HYBRID - OutLoop Control Contributions');

%% Plot the hybrid e'Qe and \int e'Qe vs Summation P
plot_OL_eTQe_Sum_P(log, 'HYBRID - $$e^T Qe_{\rm tran}$$');

%% Plot the jump map for hybrid
plot_OL_JumpMap(log, 'HYBRID - OL Jump Map');

%% Plot the series element and s for hybrid
plot_OL_S(log, 'HYBRID - Series Element');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% INNERLOOP STUFF
% =========================================================================
%% Plot the Euler Angles
plotEulerUserAndAngle(log, 'HYBRID - Euler Angles');

%% Plot the angular velocity command, reference and state
plotAngularVelocitiesUserRefState(log, 'HYBRID - Angular Velocities');

%% Plot user vs ref angular acceleration
plotAngularUserRefAcceleration(log, 'HYBRID - Angular Acceleration');

%% Plot the error in the Euler Angles and the Angular Velocities
plotErrAngleAngularVelocities(log, 'HYBRID - Rotational Error');

%% Plot rotational integral error in Euler angles
plotEulerIntError(log, 'HYBRID - Integral Euler Angle Error');

%% Plot the reference model errors in the inner loop
plotRefModelErrRot(log, 'HYBRID - Rotational Reference Model Errors');

%% Plot reference model r_cmd in the inner loop
plotRotationalRCMD(log, 'HYBRID - Rotational R Cmd');

%% Rotational innerloop virtual contols 
plotInnerLoopControls(log, 'HYBRID - Rotational Control Moments');

%% Plot baseline and adaptive control inputs
plotRotationalBaselineAdaptiveU(log, 'HYBRID - InnerLoop Control Contributions');

%% Plot the hybrid e'Qe and \int e'Qe vs Summation P
plot_IL_eTQe_Sum_P(log, 'HYBRID - $$e^T Qe_{\rm tran}$$');

%% Plot the jump map for hybrid
plot_IL_JumpMap(log, 'HYBRID - IL Jump Map');

%% Plot the series element and s for hybrid
plot_IL_S(log, 'HYBRID - Series Element');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% THRUST REALIZATION STUFF
% =========================================================================
%% Plot the total thrust
plotTotalThrustN(log, 'HYBRID - Total Thrust');

%% Plot the individual motor thrusts
plotMotorThrusts(log, 'HYBRID - Motor Thrusts');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE GAINS STUFF
% =========================================================================
%% Plot Deadzone value - Outer Loop
plotOuterloop_err_dz_op(log, der, 'HYBRID - Outerloop DeadZone');

%% Plot K Hat X - Outer Loop
plotOLKx(log, der, 'HYBRID - OL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Outer Loop
plotOLKr(log, der, 'HYBRID - OL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Outer Loop
plotOLTheta(log, der, 'HYBRID - OL $$\hat{\Theta}$$');

%% Plot Deadzone value - Inner Loop
plotInnerloop_err_dz_op(log, der, 'HYBRID - Innerloop DeadZone');

%% Plot K Hat X - Inner Loop
plotILKx(log, der, 'HYBRID - IL $$\hat{K}_{\rm x}$$');

%% Plot K Hat R - Inner Loop
plotILKr(log, der, 'HYBRID - IL $$\hat{K}_{\rm r}$$');

%% Plot Theta Hat - Inner Loop
plotILTheta(log, der, 'HYBRID - IL $$\hat{\Theta}$$');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% TOTAL COMPUTE TIME
% =========================================================================
%% Plot the total compute time 
plotTotalExecutionTime(log, der, 'HYBRID - Compute Load');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% AERODYNAMICS STUFF
% =========================================================================
%% Plot the coefficients of Lift, Drag and Moment
plotAeroCoeff(log,'HYBRID - Estimated Aerodynamic Coefficients');

%% Plot the squared norm of the body velocities
plotSqNormVel(log, 'HYBRID - Squared Norm of Body Velocities');

%% Plot the aerodynamic angles
plotAeroAngles(log, 'HYBRID - Estimated Aerodynamic Angles');

%% Plot the estimated Aero Forces and Moments in the wind frame
plotAeroForcesMoments(log, 'HYBRID - Estimated Aerodynamic Forces and Moments');

%% Plot the outerloop and inner loop dynamic inversion terms
plotAeroDynInv(log, 'HYBRID - Aero Dynamic Inversion');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'HYBRID - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'HYBRID - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'HYBRID - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'HYBRID - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'HYBRID - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'HYBRID - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'HYBRID - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'HYBRID - Mocap and VIO Orientation');
