function [x_val] = Gaussian_Elimination(A)
%% Gaussian_Elimination without pivoting
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
for i = 1:(n-1)
    
    for p = i:n
        if A(p,i) ~= 0
            break
        elseif p == n
            disp("no unique solution exists")
            return
        end % end if
    end % end for
    
    if p ~= i
        temp = A(i,:);
        A(i,:) = A(p,:);
        A(p,:) = temp;
    end % end if 
    
    for j = (i+1):n
        m = A(j,i)/A(i,i);
        
        A(j,:) = A(j,:) - m * A(i,:);
    end % end for 
end % end for

% Backward Subsitituation 
for k = 1:max_k
    y = zeros(n,1);
    
    if A(n,n) == 0
        disp("No unique solution exists")
        return
    end
    
    xn = A(n, n+k) / A(n,n);
    y(n) = xn;
    
    for i = (n-1):-1:1
        ax = A(i,(i+1):n)*y((i+1):n);
        
        xi = (A(i,n+k) - ax)/A(i,i);
        y(i) = xi;
    end
    x_val(:,k) = y; 
end % end for
end % end function