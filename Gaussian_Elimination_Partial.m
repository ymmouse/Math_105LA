function [x_val] = Gaussian_Elimination_Partial(A)
%% Gaussian Elimination with Partial Pivoting
%% Input 
% when finding Ax = b
% A = [A b]
% A is n by n+1 matrix 
% when finding inverse
% A = [A I]
% A is n by 2n matrix 
%% Ouput
% x_val is the solution
%% Initialization 
[nx,ny] = size(A);

% checking whether A is a square matrix 
if (ny-nx) == 1 || ny == 2*nx
    n = nx;
    max_k = ny - nx;
else
    error("A is not a solvable matrix");
end % end if

x_val = zeros(n,max_k);
%% Gaussian_Eliminaiton
% Elimination Process
NROW = 1:n;

for i = 1:(n-1)
    
    p = ...
        find(abs(A(NROW(i:n),i))==max(abs(A(NROW(i:n),i))),1)+i-1;
    
    if A(NROW(p),i) == 0
        disp("no unique solution exists")
        return
    end % end if    
    
    if NROW(p) ~= NROW(i)
        temp = NROW(i);
        NROW(i) = NROW(p);
        NROW(p) = temp;
    end % end if 
    
    for j = (i+1):n
        m = A(NROW(j),i)/A(NROW(i),i);
        
        A(NROW(j),:) = A(NROW(j),:) - m * A(NROW(i),:);
    end % end for 
end % end for

% Backward Subsitituation 
for k = 1:max_k
    y = zeros(n,1);
    
    if A(NROW(n),n) == 0
        disp("No unique solution exists")
        return
    end % end if
    
    xn = A(NROW(n), n+k)/A(NROW(n),n);
    y(n) = xn;
    
    for i = (n-1):-1:1
        ax = A(NROW(i),(i+1):n)*y((i+1):n);
        
        xi = (A(NROW(i),n+k) - ax)/A(NROW(i),i);
        y(i) = xi;
    end % end for
    x_val(:,k) = y; 
end % end for
end % end function