function pca_color_scale(I,last_val)
    vals = reshape(im2double(I),[],3);
    [coeff, score, ~, ~, ~, mu] = pca(vals); %, 'Centered',false);
    minval = min(score);
    maxval = max(score);    
    x = linspace(minval(1), maxval(1),600);
    y = linspace(minval(2), maxval(2),600);    
    [X, Y] = meshgrid(x,y);    
    scale = cat(3,X,Y,last_val * ones(size(X)));
    newvals = reshape(reshape(scale,[],3)*coeff' + mu,size(scale));        
    imshow(newvals)
end