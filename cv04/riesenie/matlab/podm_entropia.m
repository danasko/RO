function res = podm_entropia(Y, X)
res = 0;
counts = countcats(X);
c = categories(X);
for i=1:length(c)
    p = counts(i) / length(X);
    yn = Y(X == c{i});
    res = res + (p*entropia(yn));
end
end