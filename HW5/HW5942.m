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
B = [];

for iter = 1:n
    % construct corresponding bi
    b = zeros(n,1);
    b(iter) = 1;
    AI = [A b];

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
    y = zeros(n,1);
    
    if AI(n,n) == 0
        error("No unique solution exists")
    end
    
    xn = AI(n, n+1) / AI(n,n);
    y(n) = xn;
    
    for i = (n-1):-1:1
        sum = 0;

        for j = (i+1):n
            sum = sum + AI(i,j)*y(j);
        end
        
        xi = (AI(i,n+1) - sum)/AI(i,i);
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

%% Observation
% The second script used more time, since the second script did 
% guassian elimination three times but the first script did 
% guaasian elimination only one time. There may exists results showing
% that the difference is not obivous or even the first script used more
%time since the size of A is relatively small, by increasing the size of A,
% the difference will be larger and more obvious. 