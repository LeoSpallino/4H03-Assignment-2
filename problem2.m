% The first three important lines:
% ----------------------------------------------------------------------- %
clear variables;
close all;
clc;
% ----------------------------------------------------------------------- %

% Reading in data
% ----------------------------------------------------------------------- %
T = readtable('distillation.csv');

% saving the times column and removing it
times = T{:,1};
T(:,1) = [];

% saving a copy of the table to use the column names later
T_copy = T;

% Centering and scaling the data
% ----------------------------------------------------------------------- %
T = normalize(T);

% turn into matrix
T = T{:, :};
V = var(T);

% removing all columns with zero variance
T(:, [8,9]) = [];

% Building the PCA model
% ----------------------------------------------------------------------- %
[t, p, R2] = nipalspca(T,12);

% Part 2 - Scores plot
% ----------------------------------------------------------------------- %
low_t = floor(length(t)/2);
scoreplot(t(:, 1), t(:, 2));
hold on;
plot(t(1:low_t,1),t(1:low_t,2),'ro','MarkerFaceColor','r');
plot(t(low_t+1:length(t),1),t(low_t+1:length(t),2),'bo','MarkerFaceColor','b');
hold off;

% Part 3 - Loadings plot
% ----------------------------------------------------------------------- %
colNames = string(T_copy.Properties.VariableNames(:, [1:7,10:14]));
loading_plot(p(:,1),1, colNames);
loading_plot(p(:,2),2, colNames);

% Part 4 - Scores and Loadings Vectors Plot
% ----------------------------------------------------------------------- %
score_loading_plot(t(:,1), t(:,2), p(:,1), p(:,2), colNames);









