function [x_val, i] = recursive_formula(x0, A, tol, max_n)
% x0 is the initial point
% A is the square value that the function approximates
% tol is the tolerance
% max_n is the max iterations
%
% The function returns the approximated x value (x_val) and iterations (i)
syms x
y = @(x) 0.5*x + A/(2*x); % algorithm function

% initial condition
i = 0; % number of steps
p_new = x0; % initialize p_new

while true
    i = i + 1; 
    p_old = p_new; % set the current p to p_old
    
    p_new = y(p_old); % calculate new p value 
    
    % check whether the abs difference is less than TOL
    if abs(p_new - p_old) < tol  
        x_val = p_new;
        break
    end
    
    % check whether the max iterations is reached
    if i == max_n
        fprintf(...
            "max iterations (%i) have reached\n", i)
        x_val = p_new;
        break
    end
    
end
end
    
