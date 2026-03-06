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
addpath("plotters/helpers/mrac_long_lat/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 02/11/2026
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% ADAPTIVE DIFFERENTIATOR STUFF
% =========================================================================
%% Plot the signal (Euler Angles) vs time
plotEstimatedEulerAnglesLL(log, 'LONG LAT - Differentiator - Estimated Euler Angles');

%% Plot the differentiated singal (Euler Rates) vs time
plotDifferentiatedEulerRatesLL(log, der, 'LONG LAT - Differentiator - Estimated Euler Rates');

%% Plot the error for the signals in Euler Angles
plotEstErrEulerAnglesLL(log, der, 'LONG LAT - Differentiator - Observation Error Euler Angles');

%% Plot the error for the signals in Euler rates
plotDiffErrEulerRatesLL(log, der, 'LONG LAT - Differentiator - Observation Error Euler Rates');
