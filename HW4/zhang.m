% Qingyang Zhang
% 63831894

%% 2
% version R2019B
clear; 
clc;
format short;

%% 3,4
syms x;
g = @(x) 1 + 1/x;
syms k;
F = @(k) (((1+sqrt(5))/2)^k-((1-sqrt(5))/2)^k)/sqrt(5);

p0 = 1;
tol = 1e-5;
NO = 20;
k = 1;

%% 5,6,7
fprintf("    k         p          Fib          E\n")
while k <= NO
    p = g(p0);
    Fib = F(k+1)/F(k);
    E = abs(p-Fib);
    
    fprintf("   %.2i      %.5f     %.5f     %.5f\n",...
        k, p, Fib, E)
    
    if abs(p - Fib) < tol
        break
    end % end if
    
    k = k + 1;
    p0 = p;
end % end while



