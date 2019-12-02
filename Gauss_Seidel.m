function [x_val,k_val] = Gauss_Seidel(A,b,x0,Tol,N)
%% Input 
% A is n by n matrrix
% b is n by 1 column vector
% x0 is the initial approximation
% Tol is the tolerance
% N is the max iterations
%% Ouput
% x_val is the approximation solution
% k_val is the number of iterations
%% Initialization
k = 1;

[nx,ny] = size(A);

% checking whether A is a square matrix 
if nx == ny
    n = nx;
else
    error("A is no a square matrix");
end % end if

x = zeros(n,1);

x_list = [x0];
k_list = [k];
%% Gauss_Seidel
while k <= N
    for i = 1:n
        ax = A(i,1:(i-1))*x(1:(i-1));
        ax0 = A(i,(i+1):n)*x0((i+1):n);
        x(i) = (-ax-ax0+b(i))/A(i,i);
    end % end for
    
    x_list = [x_list x];
    k_list = [k_list k];
    if norm(x-x0) < Tol
        break
    else
        k = k + 1;
        x0 = x;
    end % end if
end % end while

if k > N
    disp("max iteration of Gauss Seidel has been reached")
end % end while

x_val = x;
%x_val = x_list;
k_val = k;
%k_val = k_list;
end % end function 

    