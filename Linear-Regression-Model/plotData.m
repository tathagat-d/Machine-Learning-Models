function plotData(x, y)
figure; % open a new figure window

% MarkerSize, size controls the size of markers
% rx is needed to draw points in color red with symbol x
plot(x, y, 'rx', 'MarkerSize', 10);

ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');
end
