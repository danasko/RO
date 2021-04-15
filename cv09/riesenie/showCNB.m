function r = showCNB(model, X, y, grid_step)
%     svInd = model.IsSupportVector;
    h = grid_step; % Mesh grid step size
    [X1,X2] = meshgrid(min(X(:,1)):h:max(X(:,1)),...
        min(X(:,2)):h:max(X(:,2)));
    [~,score] = predict(model,[X1(:),X2(:)]);
    [m, idx] = max(score,[], 2);
    score = zeros(size(score));
    c = sub2ind(size(score), (1: size(score,1)).',idx);
    score(c) = 1;
    
    scoreGrid = reshape(score(:,2),size(X1,1),size(X1,2));
    scoreGrid2 = reshape(score(:,1),size(X1,1),size(X1,2));
    
    cl = zeros(size(scoreGrid));
    cl(scoreGrid == 1) = 1;
    cl(scoreGrid2 == 1) = 2;
    cl = categorical(cl);
   
    colors = lines(length(categories(y)));
    gscatter(X1(:),X2(:),cl(:), colors);

    hold on;
    gscatter(X(:,1),X(:,2),y)
%     plot(X(:,1),X(:,2),'ro','MarkerSize',10)
%     contour(X1,X2,scoreGrid)
    colorbar;
    hold off
end