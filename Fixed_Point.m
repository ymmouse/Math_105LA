function [p_val,i] = Fixed_Point(g,p0,tol,N)
%% Input
% g is the function
% p0 is initial value
% tol is the tolerance
% N is max iteration
%% Output
% p_val is approximate solution
% k is number of iterations
%% Codes
i = 1;
p_list = [p0];

while i<=N
    p = g(p0);
    p_list = [p_list p];
    
    if abs(p-p0) < tol
        break
    end
    
    i = i+1;
    p0 = p;
    
    if i == N
        disp("Max iteration has been reached")
    end % end if
end % end while

p_val = p;
%p_val = p_list;
end % end function