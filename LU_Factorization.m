function [L,U,x] = LU_Factorization(A,b)
%% Input
% A is a n by n matrix
% b is a n by 1 column vector
%% Output
% L is a n by n lower triangular matrix
% U is a n by n Upper triangular matrix
% x is a n by 1 column vector s.t. Ax = b
%% Initialization
[nx,ny] = size(A);

% checking whether A is a square matrix 
if nx == ny
    n = nx;
else
    error("A is no a square matrix");
end % end if

% initial L and U
L = eye(n);
U = eye(n);

%% LU Factorization
U(1,1) = A(1,1)/L(1,1);

if L(1,1)*U(1,1) == 0
    error("Factorization impossible")
end % end if

for j = 2:n
    U(1,j) = A(1,j)/L(1,1);
    L(j,1) = A(j,1)/U(1,1);
end % end for

for i = 2:n

    U(i,i) = (A(i,i)-L(i,1:(i-1))*U(1:(i-1),i))/L(i,i);
    
    if i<n
        if L(i,i)*U(i,i) == 0
            error("Factorization impossible")
        end % end if
    
        for j = (i+1):n
            U(i,j) = (A(i,j) - L(i,1:(i-1))*U(1:(i-1),j))/L(i,i);
            L(j,i) = (A(j,i) - L(j,1:(i-1))*U(1:(i-1),i))/U(i,i);
        end % end for
    end % end if
end % end for

%% Finding solutions of Ax = b
% Ly = b
% y = Ux
y = zeros(n,1);
x = zeros(n,1);

y(1) = b(1)/L(1,1);
for i = 2:n
    y(i) = (b(i) - L(i,1:(i-1))*y(1:(i-1)))/L(i,i);
end % end for

x(n) = y(n)/U(n,n); 
for i = (n-1):-1:1
    x(i) = (y(i) - U(i,(i+1):n)*x((i+1):n))/U(i,i);
end % end if 
end % end function
