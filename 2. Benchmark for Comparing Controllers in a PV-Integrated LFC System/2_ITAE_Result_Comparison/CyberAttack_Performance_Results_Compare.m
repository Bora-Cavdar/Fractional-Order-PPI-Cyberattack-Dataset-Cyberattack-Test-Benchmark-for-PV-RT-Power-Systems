clc;
clear;
close all;

% -------------------------------------------------------------------------
% This script compares the ITAE-based cyberattack performance of the
% proposed FOPPI controller and the classical PPI controller.
%
% The ITAE results are read from two Excel files:
%   - CyberAttack_ITAE_Results_FOPPI.xlsx
%   - CyberAttack_ITAE_Results_PPI.xlsx
%
% Each file is assumed to contain a column named:
%   - Max_ITAE
%
% The script calculates basic statistical indicators and visualizes the
% ITAE distributions using histogram and box plot comparisons.
% -------------------------------------------------------------------------

% Read ITAE result files
data_FOPPI = readtable('CyberAttack_ITAE_Results_FOPPI.xlsx');
data_PPI   = readtable('CyberAttack_ITAE_Results_PPI.xlsx');

% Required column name
requiredColumn = 'Max_ITAE';

% Check whether the required column exists
if ~ismember(requiredColumn, data_FOPPI.Properties.VariableNames)
    error('The column "%s" was not found in CyberAttack_ITAE_Results_FOPPI.xlsx.', requiredColumn);
end

if ~ismember(requiredColumn, data_PPI.Properties.VariableNames)
    error('The column "%s" was not found in CyberAttack_ITAE_Results_PPI.xlsx.', requiredColumn);
end

% Extract ITAE values
ITAE_FOPPI = data_FOPPI.Max_ITAE;
ITAE_PPI   = data_PPI.Max_ITAE;

% Remove missing values, if any
ITAE_FOPPI = ITAE_FOPPI(~isnan(ITAE_FOPPI));
ITAE_PPI   = ITAE_PPI(~isnan(ITAE_PPI));

% -------------------------------------------------------------------------
% Calculate basic statistical indicators
% -------------------------------------------------------------------------
statsNames = {'Mean'; 'Standard Deviation'; 'Median'; 'Minimum'; 'Maximum'};

FOPPI_Stats = [
    mean(ITAE_FOPPI);
    std(ITAE_FOPPI);
    median(ITAE_FOPPI);
    min(ITAE_FOPPI);
    max(ITAE_FOPPI)
];

PPI_Stats = [
    mean(ITAE_PPI);
    std(ITAE_PPI);
    median(ITAE_PPI);
    min(ITAE_PPI);
    max(ITAE_PPI)
];

ITAE_Statistics = table(statsNames, FOPPI_Stats, PPI_Stats, ...
    'VariableNames', {'Metric', 'FOPPI', 'PPI'});

% Display statistical results
disp('ITAE Statistics for FOPPI and PPI Controllers:')
disp(ITAE_Statistics)

% -------------------------------------------------------------------------
% Figure 1: Histogram comparison of ITAE distributions
% -------------------------------------------------------------------------
figure;
set(gcf, 'Position', [100, 100, 600, 400]);

% Use common bin edges for a fair histogram comparison
all_ITAE = [ITAE_FOPPI; ITAE_PPI];
binEdges = linspace(min(all_ITAE), max(all_ITAE), 31);

hold on
histogram(ITAE_FOPPI, binEdges, ...
    'FaceAlpha', 0.5, ...
    'FaceColor', [0.4940 0.1840 0.5560], ...
    'EdgeColor', 'black');

histogram(ITAE_PPI, binEdges, ...
    'FaceAlpha', 0.5, ...
    'FaceColor', [0.3010 0.7450 0.9330], ...
    'EdgeColor', 'black');
hold off

xlabel('ITAE')
ylabel('Frequency')
legend('FOPPI', 'PPI', 'Location', 'best')
grid on

ax = gca;
ax.FontSize = 13;
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
ax.Layer = 'bottom';

% Optional figure export
% exportgraphics(gcf, 'Histogram_FOPPI_PPI.png', 'Resolution', 300);
% exportgraphics(gcf, 'Histogram_FOPPI_PPI.eps');

% -------------------------------------------------------------------------
% Figure 2: Box plot comparison of ITAE values
% -------------------------------------------------------------------------
figure;
set(gcf, 'Position', [100, 100, 600, 400]);

% Prepare data and group labels
ITAE_All = [ITAE_FOPPI; ITAE_PPI];

Group = [
    repmat({'FOPPI'}, length(ITAE_FOPPI), 1);
    repmat({'PPI'}, length(ITAE_PPI), 1)
];

% Draw box plot without using the 'Colors' parameter for better compatibility
boxplot(ITAE_All, Group);

ylabel('ITAE')
grid on

ax = gca;
ax.FontSize = 13;
ax.GridLineStyle = '--';
ax.GridAlpha = 0.4;
ax.Layer = 'bottom';
ax.Box = 'off';

% Define RGB colors
color_FOPPI = [0.4940 0.1840 0.5560];   % Equivalent to #7E2F8E
color_PPI   = [0.3010 0.7450 0.9330];   % Equivalent to #4DBEEE

% Change box colors manually for compatibility with different MATLAB versions
boxHandles = findobj(gca, 'Tag', 'Box');

for i = 1:length(boxHandles)
    xData = get(boxHandles(i), 'XData');
    boxPosition = mean(xData);

    if boxPosition < 1.5
        % First box: FOPPI
        set(boxHandles(i), 'Color', color_FOPPI, 'LineWidth', 1.5);
    else
        % Second box: PPI
        set(boxHandles(i), 'Color', color_PPI, 'LineWidth', 1.5);
    end
end

% Optional figure export
% exportgraphics(gcf, 'BoxPlot_FOPPI_PPI.png', 'Resolution', 300);
% exportgraphics(gcf, 'BoxPlot_FOPPI_PPI.eps');

% -------------------------------------------------------------------------
% Optional: Save numerical comparison results
% -------------------------------------------------------------------------
% save('ITAE_Comparison.mat', 'ITAE_FOPPI', 'ITAE_PPI', 'ITAE_Statistics');
% writetable(ITAE_Statistics, 'ITAE_Statistics_FOPPI_PPI.xlsx');