function res = podm_entropia(Y, X) # H(Y|X)
  [categories, ~, idx] = unique(X);
  counts = accumarray(idx, 1);
  res = 0;
  for i=1:length(categories)
   res += sum(counts(i)/length(X) * entropia(Y(strcmp(X,categories{i}))));
  endfor
endfunction
