function res = entropia(X)
    counts = countcats(X);
    p = counts/length(X);
    p2 = log2(p);
    p2(p==0) = 0;
    res = - sum(p .* p2);
end