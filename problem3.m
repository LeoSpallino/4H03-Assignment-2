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

% Building the PCA model by Eigenvalue Decomposition
% ----------------------------------------------------------------------- %
[t, p, R2] = eigen_decomp(T,3);

colNames = string(T_copy.Properties.VariableNames(:, [1:7,10:14]));
loading_plot(p(:,1),1, colNames);
loading_plot(p(:,2),2, colNames);
