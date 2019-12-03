% Qingyang Zhang
% 63831894
% HW3

%% Initialization
% version R2019B
clear ; close all; clc
format long
syms x A;

%% Configuration
tol = 1e-8; % tolerance
max_n = 20000; % max iterations

% A 
A1 = 5;
A2 = 105;
A3 = 11115;

% initial point
p10 = 1;
p20 = 5;
p30 = 10;
%% 1)
% recursive_formula(initial point, A, tol, max_n)
% Approximation for sqrt 5
[x1, n1] = recursive_formula(p10, A1, tol, max_n);
% Approximation for sqrt 105
[x2, n2] = recursive_formula(p20, A2, tol, max_n); 
% Approximation for sqrt 11115
[x3, n3] = recursive_formula(p30, A3, tol, max_n);

%% 2)
fprintf("\nThe number of iterations N of A = %i is %i\n", A1, n1)
fprintf("The number of iterations N of A = %i is %i\n", A2, n2)
fprintf("The number of iterations N of A = %i is %i\n\n", A3, n3)

%% 3）
fprintf("The p value for sqrt of %i is %f\n", A1, x1)
fprintf("The p value for sqrt of %i is %f\n", A2, x2)
fprintf("The p value for sqrt of %i is %f\n\n", A3, x3)

%% 4)
fprintf("The initial value p10 = %i\n", p10)
fprintf("The initial value p10 = %i\n", p10)
fprintf("The initial value p10 = %i\n\n", p10)

%% 5)
p10_2 = -p10;
% approximation for sqart 5 with negative initial point 
[x1_2, n1_2] = recursive_formula(p10_2, A1, tol, max_n);
fprintf("The p value for sqrt of A = %i\n", A1) 
fprintf("with negative initial values (%i) ", p10_2)
fprintf("is %f\n", x1_2)
% Observation:
%   This formula of fixed point method cannot provide the answer with
% negative initial point, since when the initial value x0 is negative and
% the value of A is positve recursive formula will do the approximation in 
% the negative approach which will approximate the answer to the negative 
% sqaure root of A which is correct by taking the absolute value.