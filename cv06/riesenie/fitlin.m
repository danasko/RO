data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

figure; hold on;
pos = find(y == 1);
neg = find(y == 0);
plot(X(pos, 1), X(pos, 2), 'r.');
plot(X(neg, 1), X(neg, 2), 'g+');

Mdl = fitclinear(X,y);
w = Mdl.Beta;
b = Mdl.Bias;
% f = transpose(w) .* X + b;

if size(X, 2) <= 3
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];
    plot_y = (-1./w(2)).*(w(1).*plot_x + b);
    plot(plot_x, plot_y)    
    axis([30, 100, 30, 100])
end