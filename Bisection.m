function [F_val,x_val,k_val] = Bisection(f,a,b, tol, N)
%% Input
% f is a function in 2D
% a is the left endpoint
% b is the right endpoint
% tol is the tolerance
% N is the max iteration 
%% Output 
% F_val is the value of x, i.e. F = f(x)
% x_val is the approximation value s.t. f(x) = 0
% k_val is the number of iterations
%% Codes
FA = f(a);

if f(a)*f(b) > 0
    disp("a,b have same signs")
    disp("Choose other values and restart")
    return
end % end if

F_list = [];
x_list = [];
k_list = [];

for k = 1:N
    x_temp = (a+b)/2;
    Fx = f(x_temp);
    
    F_list = [F_list Fx];
    x_list = [x_list x_temp];
    k_list = [k_list k];
    
    if abs(Fx) < tol || (b-a)/2 < tol
        break
    end % end if
    
    if FA*Fx > 0
        a = x_temp;
        FA = Fx;
    else
        b = x_temp;
    end % end if
end % end for

if k == N
    disp("Max iterations have been reached")
end % end if

F_val = F_list;
x_val = x_list;
k_val = k_list;
%F_val = Fx;
%x_val = x_temp;
%k_val = k;
end % end function