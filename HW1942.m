% QingyangZhang 63831894
% HW1-Problem 2
%% Initialization
% version R2019B
clear ; close all; clc
format long
syms x

%% a) 
%syms x;
%syms n positive integer;
%f(x) = atan(x);
%P(x,n) = taylor(f, x, 'Order', n);

%% b)
% Taylor approximation of formula (1)
%approx1(n) = 4*(P(1/2, n) + P(1/3, n));

% Taylor approximation of formula (2)
%approx2(n) = 16*P(1/5, n) - 4*P(1/239, n);

%% c)
n1 = 1; n2 = 1; 
f(x) = atan(x);
tol = 10^(-21);

% Find n1 such that error of formula (1) = tol
while true
    P(x) = taylor(f, x, 'Order', n1);
    approx1 = 4*(P(1/2) + P(1/3));
    E = abs(pi - approx1);
    
    if E < tol
        break
    end
    n1 = n1 + 1;
end

% Find n2 such that error of formula (2) = tol
while true
    P(x) = taylor(f, x, 'Order', n2);
    approx2 = 16*P(1/5) - 4*P(1/239);
    E = abs(pi - approx2);
    
    if E < tol
        break
    end
    n2 = n2 + 1;
end
fprintf("n1 = %i\n", n1)
fprintf("n2 = %i\n", n2)

%% d)
% formula(2) is more accurate in calculating pi, since formlua (2) has a
% smalle n for error 10^(-21)