% Euler's method on system of equations.

f1 = @(x, y) y(2)^2-2*y(1);      % EQ1
f2 = @(x, y) y(1)-y(2)-x*y(2)^2; % EQ2
f =  @(x, y) [f1(x,y) f2(x,y)];  % System

a = 0;        % Lower bound
b = 3;        % Upper bound
h = 0.01;     % Step size
n = (b-a)/h;  % Intevals

X = zeros(n+1, 1);
Y = zeros(n+1, 2);
X(1) = a;         % Starting x-value
Y(1, :) = [1 0];  % Starting y-values

disp('   x               y1              y2')
fprintf('%.6f\t%.6f\t%.6f\n', X(1), Y(1,:))

for i = 1:n
  x = X(i);
  y = Y(i, :);
  Y(i+1, :) = y+h*f(x,y);
  X(i+1) = x+h;
  fprintf('%.6f\t%.6f\t%.6f\n', X(i+1), Y(i+1, :))
end

plot(X, Y);