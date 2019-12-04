function [p_val,i] = Newton(f,df,p0,tol,N)
%% Input
% f is the function
% df is the first derivative
% p0 is the initial approximation
% tol is the toleration
% N is the max iteration
%% Output
% p_val is the approximate solution
% i is the number of iterations
%% Codes
i = 1;
p_list = [p0];

while i <= N
    p = p0 - f(p0)/df(p0);
    p_list = [p_list p];
    
    if abs(p-p0) < tol
        break
    end
    
    if i == N
        disp("Max iteration of Newton has been reached")
    end
    
    i = i + 1;
    p0 = p;
end % end while
p_val = p_list;
%p_val = p;
end % end function