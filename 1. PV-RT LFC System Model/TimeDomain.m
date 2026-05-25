clc;
clear;
close all;

% -------------------------------------------------------------------------
% This script simulates the PV-integrated two-area load frequency control
% (LFC) system using the PPI controller.
%
% The system parameters are loaded from:
%   - LFC_PV_Test_System_Parameters.m
%
% The Simulink model used in this script is:
%   - PPI_2024a.slx
%
% The script plots the following time-domain responses:
%   1) Frequency deviation in Area 1, Delta f1
%   2) Frequency deviation in Area 2, Delta f2
%   3) Tie-line power deviation, Delta Ptie
%
% Note:
% The Simulink model is assumed to export the following variables to the
% MATLAB workspace:
%   - tout
%   - df1_out
%   - df2_out
%   - dPtie_out
% -------------------------------------------------------------------------

% Load PV-RT LFC system parameters
LFC_PV_Test_System_Parameters;

% PI controller parameters
Kp = 0.5663;
Ki = 0.4024;

% Simulation time in seconds
simulation_time = 30;

% Run the Simulink model
[t, y] = sim('PV_RT_PI_2024a', simulation_time);

% -------------------------------------------------------------------------
% Figure 1: Frequency deviation response in Area 1
% -------------------------------------------------------------------------
figure(1)
plot(tout, df1_out, 'LineWidth', 2)

xlabel('Time (s)')
ylabel('\Deltaf_{1} (pu)')
grid on

ax = gca;
ax.GridColor = [0.3010 0.7450 0.9330];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
ax.Layer = 'bottom';
ax.FontSize = 13;

% -------------------------------------------------------------------------
% Figure 2: Frequency deviation response in Area 2
% -------------------------------------------------------------------------
figure(2)
plot(tout, df2_out, 'LineWidth', 2)

xlabel('Time (s)')
ylabel('\Deltaf_{2} (pu)')
grid on

ax = gca;
ax.GridColor = [0.3010 0.7450 0.9330];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
ax.Layer = 'bottom';
ax.FontSize = 13;

% -------------------------------------------------------------------------
% Figure 3: Tie-line power deviation response
% -------------------------------------------------------------------------
figure(3)
plot(tout, dPtie_out, 'LineWidth', 2)

xlabel('Time (s)')
ylabel('\DeltaP_{tie} (pu)')
grid on

ax = gca;
ax.GridColor = [0.3010 0.7450 0.9330];
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
ax.Layer = 'bottom';
ax.FontSize = 13;