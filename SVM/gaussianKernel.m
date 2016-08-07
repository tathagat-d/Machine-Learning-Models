function sim = gaussianKernel(x1, x2, sigma)
% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

numerator = sum( (x1 - x2) .^ 2);
denominator = 2 * sigma ^ 2;
sim = exp( - numerator / denominator);
% =============================================================
    
end
