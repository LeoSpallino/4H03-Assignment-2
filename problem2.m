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

% Part 2 - Scores plot
% ----------------------------------------------------------------------- %
point = 250;
low_t = floor(length(t)/2);
scoreplot(t(:, 1), t(:, 2));
hold on;
plot(t(1:low_t,1),t(1:low_t,2),'ro','MarkerFaceColor','r');
plot(t(low_t+1:length(t),1),t(low_t+1:length(t),2),'bo','MarkerFaceColor','b');
hold off;








