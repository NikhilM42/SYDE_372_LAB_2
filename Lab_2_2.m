clc;
clear;

load('lab2_2.mat','al');
load('lab2_2.mat','bl');
load('lab2_2.mat','cl');

%% Maximum likelihood method
%% Parametric Estimation - Gaussian

ual = mean(al);
ubl = mean(bl);
ucl = mean(cl);
sal = cov(al);
sbl = cov(bl);
scl = cov(cl);



hold on;
scatter(al(:,1),al(:,2))
scatter(bl(:,1),bl(:,2))
scatter(cl(:,1),cl(:,2))
hold off;