% Function that calculate the scores (t), loadings (p), and R2 
% for a matrix using Eigenvalue Decomposition

% Accepts data matrix A, and number of components N

function [t, p, R2] = eigen_decomp(A, N)
    R2 = zeros(1,N);
    [eigvectors, eigvalues] = eig(A'*A);
        
    p = fliplr(eigvectors); % flipping the matrix so that it's in right order
    p = p(:,1:N);   % returning only columns 1 to N vectors

    t = A*p;
    
    % Need to flip the eigenvalue matrix so that it's in the right order
    lambdas = fliplr(flipud(eigvalues));

    % get the total variance
    total_var = sum(diag(eigvalues));

    % calculate the R2 for each component
    for i = 1:N
        R2(1,i) = lambdas(i,i) / total_var;

        % if it's not the first component, makes it a cumulative sum
        if i > 1
            R2(1,i) = R2(1,i) + R2(1,i-1);
        end
    end
end