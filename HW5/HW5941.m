% QingyangZhang 63831894
%% Initialization
% version R2019B
clear all;
format short

%% 
A = [2 -3 1;...
     1 1 -1;...
    -1 1 -3];

[nx, ny] = size(A);

% Check whether A is a square matrix
if nx ~= ny
    % Raise an error if A is not square
    error("A is not a n by n matrix")
else
    n = nx;
end

%% 
tic
% construct argumented matrix
AI = [A eye(n)]; 
B = [];

% Elimination process
for i = 1:(n-1) 
    for p = i:n
        if AI(p,i) ~= 0
            break
        end
    end
    
    if p ~= i
        temp = AI(i,:);
        AI(i,:) = AI(p,:);
        AI(p,:) = temp;
    end
    
    for j = (i+1):n
        m = AI(j,i)/AI(i,i);
        AI(j,:) = AI(j,:) - m * AI(i,:);
    end
end

% Backward substitution 
for k = 1:n
    y = zeros(n,1);
    
    if AI(n,n) == 0
        error("No unique solution exists")
    end
    
    xn = AI(n, n+k) / AI(n,n);
    y(n) = xn;
    
    for i = (n-1):-1:1
        sum = 0;

        for j = (i+1):n
            sum = sum + AI(i,j)*y(j);
        end
        
        xi = (AI(i,n+k) - sum)/AI(i,i);
        y(i) = xi;
    end
    B = [B y]; 
end
toc
%% 
b = [2;-1;0];
% solve Ax = b
x = B*b;

% display results
disp("B = A^-1:")
disp(B)
disp("A*B:")
disp(A*B)
disp("x:")
disp(x)