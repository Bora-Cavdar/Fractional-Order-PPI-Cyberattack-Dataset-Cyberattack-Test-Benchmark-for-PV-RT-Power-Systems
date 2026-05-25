clc; clear; close all;

% -------------------------------------------------------------------------
% This script compares the transient responses of the classical PPI
% controller and the proposed FOPPI controller optimized by the
% Artificial Rabbits Optimization (ARO) algorithm.
%
% The response data are read from Excel files:
%   - transient_response_foppi_ARO.xlsx : FOPPI-ARO response data
%   - transient_response_ppi_ARO.xlsx   : PPI-ARO response data
%
% Each Excel file is assumed to contain the following columns:
%   Column 1 : Time vector, t (s)
%   Column 2 : Frequency deviation in Area 1, Delta f1 (pu)
%   Column 3 : Frequency deviation in Area 2, Delta f2 (pu)
%   Column 4 : Tie-line power deviation, Delta Ptie (pu)
% -------------------------------------------------------------------------

% Read transient response data from Excel files
Result_FOPPI = xlsread('transient_response_foppi_ARO.xlsx');
Result_PPI   = xlsread('transient_response_ppi_ARO.xlsx');

% Extract the simulation time vector
tout = Result_FOPPI(:,1);

% Extract FOPPI-ARO response signals
FOPPI_df1_out_real   = Result_FOPPI(:,2);   % Delta f1 response of FOPPI-ARO
FOPPI_df2_out_real   = Result_FOPPI(:,3);   % Delta f2 response of FOPPI-ARO
FOPPI_dPtie_out_real = Result_FOPPI(:,4);   % Delta Ptie response of FOPPI-ARO

% Extract PPI-ARO response signals
PPI_df1_out_real   = Result_PPI(:,2);       % Delta f1 response of PPI-ARO
PPI_df2_out_real   = Result_PPI(:,3);       % Delta f2 response of PPI-ARO
PPI_dPtie_out_real = Result_PPI(:,4);       % Delta Ptie response of PPI-ARO

% -------------------------------------------------------------------------
% Figure 1: Comparison of frequency deviation in Area 1
% -------------------------------------------------------------------------
figure(1)
plot(tout, PPI_df1_out_real, 'LineWidth', 2, 'Color', '#4DBEEE')
hold on
plot(tout, FOPPI_df1_out_real, 'LineWidth', 2, 'Color', '#7E2F8E')

ylim([-0.25 0.10])
xlabel('Time (s)')
ylabel('\Deltaf_{1} (pu)')

legend('PPI-ARO', 'FOPPI-ARO', 'Location', 'southeast', 'FontSize', 13)
grid on

% -------------------------------------------------------------------------
% Figure 2: Comparison of frequency deviation in Area 2
% -------------------------------------------------------------------------
figure(2)
plot(tout, PPI_df2_out_real, 'LineWidth', 2, 'Color', '#4DBEEE')
hold on
plot(tout, FOPPI_df2_out_real, 'LineWidth', 2, 'Color', '#7E2F8E')

ylim([-0.25 0.10])
xlabel('Time (s)')
ylabel('\Deltaf_{2} (pu)')

legend('PPI-ARO', 'FOPPI-ARO', 'Location', 'southeast', 'FontSize', 13)
grid on

% -------------------------------------------------------------------------
% Figure 3: Comparison of tie-line power deviation
% -------------------------------------------------------------------------
figure(3)
plot(tout, PPI_dPtie_out_real, 'LineWidth', 2, 'Color', '#4DBEEE')
hold on
plot(tout, FOPPI_dPtie_out_real, 'LineWidth', 2, 'Color', '#7E2F8E')

ylim([-0.03 0.04])
xlabel('Time (s)')
ylabel('\DeltaP_{tie} (pu)')

legend('PPI-ARO', 'FOPPI-ARO', 'Location', 'southeast', 'FontSize', 13)
grid on