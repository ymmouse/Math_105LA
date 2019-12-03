% QingyangZhang 63831894
% HW1-Problem 1
%% Initialization
% version R2019B
clear ; close all; clc
format long

%% a) 
% f = exp(x/2)*sin(x/3);
% P(5) = taylor(f, x, 'Order', 5);

%% b)
syms x;
i_val = linspace(0,20,21);
x_val = i_val/20;
f(x) = exp(x/2)*sin(x/3);
P5(x) = taylor(f, x, 'Order', 5);

% Actual Value
actual_val = f(x_val);
disp('Actual Value')
disp(actual_val)

% approximation value
approx_val = P5(x_val);
disp('Approximation Value')
disp(approx_val)

%% c)
% Error Ei
E_val = abs(actual_val - approx_val);
disp('Error')
disp(E_val)

%% d)
% Graph points (x, E)
figure();
scatter(x_val, E_val, 'filled')

%% e)
%% f)
% From the graph, since the points increase exponentially,
% the growth of error is exponential. So error is unstable

