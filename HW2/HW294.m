% Qingyang Zhang
% 63831894
% HW2

%% Initialization
% version R2019B
clear ; close all; clc
format long
syms x;

%% Configuration
a = -0.5;
b = 1;
tol = 1e-5;
p = 0;
plt_inv = [-0.5, 1];
max_n = 1000;

f(x) = tan(x);
g(x) = x;
h(x) = f(x) - g(x);

HA = f(a);
HB = f(b);
%% Bisection step
for n = 1:max_n
    if HA*HB > 0
        fprintf("Error!\n")
        fprintf("The value of two endpoints have same sign!\n")
        break
    end
    
    p = (a+b)/2;
    HP = h(p);
    
    if HP == 0 || (b-a)/2 <= tol
        break
    else
        if HA*HP > 0
            a = p;
            HA = HP;
        else
            b = p;
            HB = HP;
        end
    end
      
    if n == max_n
        fprintf("Max iteration reached\n")
        fprintf("The function does not converge\n")
    end
end


%% a)
fprintf('n: %i\n', n)

%% b)
% 
xh = vpasolve(h(x) == 0);
fprintf('xh: %f\n', xh)

%% c)
E = abs(xh - p);
fprintf('E: %f\n', E)

%% d)
figure();
fplot(f(x), plt_inv, 'b')
hold on 
fplot(g(x), plt_inv, 'r')
hold off
legend('tanx', 'x')
title('Output 4')
grid on 

%% e)
% xh is more accurate since as xh = 0, tan(0) = 0 = x. so h(x) is actually
% equal to 0. But the x gained from bisection step is just a value that
% less than the tolerance = 10^-5.

    