function [mu_val,x_val,k_val] = Power_Method(A,x,Tol,N)
%% Input 
% A is n by n matrrix
% x is non-zero n by 1 column vector
% Tol is the tolerance
% N is the max iterations
%% Ouput
% mu_val is the approxiamtion eigenvalue
% x_val is the approximation eigenvector with max(|x|) = 1
% k_val is the number of iterations
%% Initialization
[nx,ny] = size(A);

% checking whether A is a square matrix 
if nx == ny
    n = nx;
else
    error("A is no a square matrix");
end % end if

k = 1;
p = find(abs(x)==max(abs(x)),1);
x = x./x(p);
mu_list = [];
x_list = [x];
k_list = [0];
%% power method

while k <= N
    
    y = A*x;
    mu = y(p);
    p = find(abs(y)==max(abs(y)),1);
    
    if y(p) == 0
        fprintf("A has the eigenvalue 0,\n")
        fprintf("select a new vector x and restart\n")
        break
    end % end if
    
    err_vec = x - y./y(p);
    ERR = max(abs(err_vec));
    x = y./y(p);
    
    k_list = [k_list k];
    mu_list = [mu_list mu];
    x_list = [x_list x];
    if ERR < Tol
        break
    else
        k = k + 1;
    end % end if
end % end while

if k > N
    disp("max iteration of Power Method has been reached")
end % end if

x_val = x;
%x_val = x_list;
mu_val = mu;
%mu_val = mu_list;
k_val = k;
%k_val = k_list;
end % end function
    