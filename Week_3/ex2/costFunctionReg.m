function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for i = 1:m
  C = (-y(i) * log(sigmoid(X(i,:) * theta))) - ((1-y(i))* log(1 - sigmoid((X(i,:) * theta))))
  J = J + C;
end

J = J/m;
D=0
for i=2:length(theta)
  C = theta(i)^2
  D = D + C
end
D = (D*lambda)/(2*m)

J=J+D


k = zeros(size(theta));
for i = 1:m
  C = (sigmoid(X(i,:) * theta) - y(i)) * transpose(X(i,:));
  k = k + C;
end
k = k/m;

grad = k+(lambda/m)*theta;
grad(1)= grad(1)-(lambda/m)*theta(1)



% =============================================================

end
