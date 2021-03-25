function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% Doplnte hodnoty tymto premennym
f = X*theta;
J = sum(-y .* log(sigmoid(f)) - (1-y).*log(1-sigmoid(f)))/m;
% grad = zeros(size(theta));

grad = sum((sigmoid(f)-y) .* X)/m; 

% regularization
for i=2:length(theta)
    J= J + (theta(i)^2);
end

end
