% The first three important lines:
% ----------------------------------------------------------------------- %
clear variables
close all
clc
% ----------------------------------------------------------------------- %

% Reading in data
% ----------------------------------------------------------------------- %
T = readtable('distillation.csv');

% Saving and removing the time column
times = T{:,1};
T(:,1) = [];

% turn into matrix
T = T{:, :};
V = var(T);

% removing all columns with zero variance
T(:, [1,2,7,8,9,10,11,12,13,14]) = [];
% ----------------------------------------------------------------------- %

% Building the PCA models
% ----------------------------------------------------------------------- %
[t, p, R2] = nipalspca(T,3);
