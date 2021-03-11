function res = entropia(X)
  [categories, ~, idx] = unique(X);
  counts = accumarray(idx, 1);
  p = counts/length(X);
  p2(p==0) = 0;
  p2 = log2(p);
  res = - sum(p .* p2);
endfunction
