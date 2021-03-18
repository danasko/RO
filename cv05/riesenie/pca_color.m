function pca_color(I,last_val)
    vals = reshape(im2double(I),[],3);
    [coeff, score, ~, ~, ~,mu] = pca(vals); %, 'Centered',false);

    score(:,3) = last_val;
    
    newvals = score * coeff' + mu;
    
    imshow(reshape(newvals, size(I)))
end